package site.awsomekingmoon.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;


/**
 * @author 박영준
 * MemberVo
 */
@Data @Alias("member")
public class MemberVo {
	/** 회원 아이디*/
	private String id;
	/** 회원 비밀번호*/
	private String pw;
	/** 회원 이메일*/
	private String email;
	/** 회원 이름*/
	private String name;
	/** 회원 닉네임*/
	private String nickname;
	/** 회원 전화번호*/
	private String phone;
	/** 회원 주소*/
	private String address;
	
	/** 회원 위치의 경도*/
	private double longitude;
	/** 회원 위치의 위도*/
	private double latitude;
	
	/** 회원 가입일*/
	private Date regDate;
	/** 회원 탈퇴일*/
	private Date outDate;
	
	/** 사용자가 활성화 된 경우 true로 설정*/
	private boolean enabled;
	
	/** 회원 상태 0:탈퇴 1:회원 2:관리자*/
	private int status;
	
	/** 회원 인증*/
	private List<AuthVo> auths;
}
