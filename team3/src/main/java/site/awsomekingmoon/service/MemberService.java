package site.awsomekingmoon.service;

import java.util.List;
import java.util.Map;

import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.MemberVo;

/**
 * @author 박영준, 김문수
 * 회원 기능
 */
public interface MemberService {
	/**
	 * @author 박영준
	 * 회원 가입
	 */
	void register(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 회원정보 조회
	 */
	MemberVo get(String id);
	
	/**
	 * @author 박영준
	 * 회원정보 수정
	 */
	boolean modify(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 회원 탈퇴
	 */
	void withdraw(String id);
	
	/**
	 * @author 박영준
	 * 문자 보내기
	 */
	void sendMessage(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 랜덤인증번호
	 */
	String createKey();
	
	/**
	 * @author 박영준
	 * 인증번호 저장
	 */
	void insertAuthPhone(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 인증번호 확인
	 */
	boolean confirmAuth(Map<String, Object> map);
	
	/**
	 * @author 김문수
	 * admin용 회원목록 조회
	 */
	List<MemberVo> memberList(Criteria cri);
	/**
	 * @author 김문수
	 * 회원 수 조회
	 */
	int memberCount(Criteria cri);
	
}
