package site.awsomekingmoon.security;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;


/**
 * @author 박영준
 * CustomNoOpEncoder
 */
//@Component("noop")
@Log4j
public class CustomNoOpEncoder implements PasswordEncoder{
	
	/** 비밀번호 인코딩*/
	@Override
	public String encode(CharSequence arg0) {
		log.info(arg0);
		return arg0.toString();
	}
	
	/** 비밀번호 일치 여부 확인*/
	@Override
	public boolean matches(CharSequence arg0, String arg1) {
		log.info("matches :: " + arg0 + "::" + arg1);
		return arg0.toString().equals(arg1);
	}

}
