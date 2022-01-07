package site.awsomekingmoon.controller;

import static org.junit.Assert.assertNotNull;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.MemberVo;

/**
 * @author 박영준
 * 2021.11.10
 * 회원 컨트롤러 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class MemberControllerTests {
	@Setter @Autowired
	private WebApplicationContext ctx;
	private MockMvc mvc;
	
	@Before
	public void setup() {
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testExist() {
		assertNotNull(ctx);
		assertNotNull(mvc);
		log.info(ctx);
		log.info(mvc);
	}
	
	/**
	 * @author 박영준
	 * 회원정보 조회 테스트
	 */
	@Test
	@WithAnonymousUser
	public void join_typeTest() throws Exception {
		mvc.perform(get("/member/type"))
				.andExpect(status().is(200));
	}
	
	/**
	 * @author 박영준
	 * 문자 보내기 테스트
	 */
	@Test
	@WithAnonymousUser
	public void testSend() throws Exception {
		mvc.perform(MockMvcRequestBuilders.post("/member/send")
				.param("authKey", "vah212")
				.param("phone", "테스트할핸드폰번호"))
		.andExpect(status().is(200))
		.andReturn()
		.getModelAndView();
	}
	
	/**
	 * @author 박영준
	 * 인증번호 확인 테스트
	 */
	@Test
	public void testConfirm() throws Exception {
		mvc.perform(MockMvcRequestBuilders.post("/member/confirm")
				.param("authKey", "vah212")
				.param("phone", "테스트할핸드폰번호"))
		.andExpect(status().is(200))
		.andReturn()
		.getModelAndView();
	}
	
	/**
	 * @author 박영준
	 * 회원 가입 테스트
	 */
	@Test
	@WithAnonymousUser
	public void testRegister() throws Exception {
		mvc.perform(MockMvcRequestBuilders.post("/member/register")
				.param("id", "user15")
				.param("pw", "1234")
				.param("email", "user15@gmail.com")
				.param("name", "킹영준")
				.param("nickname", "일반사용자15")
				.param("phone", "01015151515")
				.param("auth", "ROLE_USER"))
		.andReturn()
		.getModelAndView();
	}
	
	/**
	 * @author 박영준
	 * 비동기 아이디 중복체크
	 */
	@Test
	@WithAnonymousUser
	public void testIdValid() throws Exception {
		MemberVo member = new MemberVo();
		member.setId("user0");
		
		String jsonStr = new Gson().toJson(member);
		
		log.info("jsonStr :: " + jsonStr);
		
		mvc.perform(MockMvcRequestBuilders.get("/register")
				.contentType(MediaType.APPLICATION_JSON_VALUE)
				.content(jsonStr))
				.andExpect(status().is(200))
				.andReturn();
	}
	
	/**
	 * @author 박영준
	 * 비동기 이메일 중복체크
	 */
	@Test
	@WithAnonymousUser
	public void testEmailValid() throws Exception {
		MemberVo member = new MemberVo();
		member.setEmail("user0@gmail.com");
		
		String jsonStr = new Gson().toJson(member);
		
		log.info("jsonStr :: " + jsonStr);
		
		mvc.perform(MockMvcRequestBuilders.get("/register")
				.contentType(MediaType.APPLICATION_JSON_VALUE)
				.content(jsonStr))
				.andExpect(status().is(200))
				.andReturn();
	}
	
	/**
	 * @author 박영준
	 * 회원정보 수정 테스트
	 */
	@Test
	@WithMockUser(roles = "USER")
	public void testInfo() throws Exception {
		mvc.perform(MockMvcRequestBuilders.post("/member/info")
				.param("id", "user0")
				.param("name", "박영준")
				.param("nickname", "일반사용자0")
				.param("email", "user0@gmail.com")
				.param("phone", "01012345670"))
		.andReturn()
		.getModelAndView();
	}
	
	/**
	 * @author 박영준
	 * 회원 탈퇴 테스트
	 */
	@Test
	@WithMockUser(roles = "USER")
	public void testWithdraw() throws Exception {
		mvc.perform(MockMvcRequestBuilders.post("/member/info")
				.param("id", "user0")
				.param("pw", "1234")
				.param("ckPw", "user0"))
		.andReturn()
		.getModelAndView();
	}
	
	/**
	 * @author 박영준
	 * 로그인
	 */
	@Test
    @WithMockUser
    public void testlogin() throws Exception {
		mvc.perform(post("/common/login")
				.param("username", "user0")
				.param("password", "1234")
				.with(csrf()))
		.andExpect(status().is3xxRedirection())
		.andExpect(redirectedUrl("/"))
		.andExpect(authenticated());
		
    }
	
}
