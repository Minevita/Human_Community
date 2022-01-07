package site.awsomekingmoon.security.domain;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import site.awsomekingmoon.domain.MemberVo;

/**
 * @author 박영준
 * CustomUser
 */
@Getter
public class CustomUser extends User{
	/** MemberVo 호출*/
	private MemberVo memberVo;
	
	/** 생성자*/
	public CustomUser(MemberVo vo) {
		super(vo.getId(), vo.getPw(), 
				vo.getAuths()
				.stream()
				.map(a->new SimpleGrantedAuthority(a.getAuth()))
				.collect(Collectors.toList()));
		this.memberVo = vo;
	}
}
