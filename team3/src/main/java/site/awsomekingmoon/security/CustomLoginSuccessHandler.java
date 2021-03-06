package site.awsomekingmoon.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

/**
 * @author 박영준, 김문수
 * CustomLoginSuccessHandler
 */
@Log4j
@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	/** onAuthenticationSuccess 사용자가 성공적으로 인증되면 호출*/
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth)
			throws IOException, ServletException {
		log.warn("login success");
		log.info("auth : "+ auth);
		
		String url = req.getParameter("url");
		req.getHeader("");
		
		if(url == null) {
			// referer 사용
			String referer = req.getParameter("referer");
			log.warn(referer);
		}
		else {
			// url 사용
		}
		/**
		 * @author 김문수
		 * 관리자 로그인시 관리자 페이지 이동 조건 
		 */
		List<String> role = new ArrayList<>(); 
		auth.getAuthorities().forEach(authority->{
			role.add(authority.getAuthority());
		});
		
		if(role.contains("ROLE_USER")){
			resp.sendRedirect("/");
			return;
		}
		
		if(role.contains("ROLE_ADMIN")){
			resp.sendRedirect("/adminPage");
			return;
		}
	}
}
