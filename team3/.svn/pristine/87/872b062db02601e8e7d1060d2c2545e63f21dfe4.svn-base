package site.awsomekingmoon.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.MemberVo;
import site.awsomekingmoon.mapper.MemberMapper;
import site.awsomekingmoon.security.domain.CustomUser;


/**
 * @author 박영준
 * CustomUserDetailsService
 */
@Log4j @Component
public class CustomUserDetailsService implements UserDetailsService{
	/** MemberMapper Interface 호출*/
	@Autowired @Setter
	private MemberMapper mapper;
	
	/** 사용자 이름을 기반으로 사용자 찾기*/
	@Override
	public UserDetails loadUserByUsername(String arg0) throws UsernameNotFoundException {
		log.warn(arg0);
		MemberVo vo = mapper.read(arg0);
		return vo == null ? null : new CustomUser(vo);
	}
}
