package site.awsomekingmoon.mapper;

import java.util.List;
import java.util.Map;

import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.MemberVo;

/**
 * @author 박영준, 김문수
 * MemberMapper
 */
public interface MemberMapper {
	/**
	 * @author 박영준
	 * 회원가입
	 */
	void insertMember(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 회원가입 후 security 권한 부여
	 */
	void insertAuth(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 회원정보 불러오기
	 */
	MemberVo read(String id);
	
	/**
	 * @author 김문수
	 * admin용 멤버조회
	 */
	List<MemberVo> memberList();
	/**
	 * @author 김문수
	 * admin용 멤버조회 with page
	 */
	List<MemberVo> memberListWithPaging(Criteria cri);
	/**
	 * @author 김문수
	 * admin용 멤버 수 조회
	 */
	int getMemberCount(Criteria cri);
	
	
	/**
	 * @author 박영준
	 * 핸드폰 인증번호, 핸드폰 번호, 만료시간(시스템시간+3분) DB저장
	 */
	void insertAuthPhone(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * VIEW에서 입력한 인증번호가 DB에 저장된 인증번호 일치하고
	 * 3분 이내(EXP-SYSDATE > 0)에 완료됐으면 1 반환
	 */
	int confirmAuth(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 회원정보 수정
	 */
	int modify(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 회원정보 수정 전 자식 테이블(보드) 수정
	 */
	int modifyChild(Map<String, Object> map);
	
	/**
	 * @author 박영준
	 * 회원 탈퇴(UPDATE, 회원 테이블 STATUS -> 0)
	 */
	void withdraw(String id);
	
	/**
	 * @author 박영준
	 * 회원 탈퇴(UPDATE) - 권한 수정
	 */
	void withdrawAuth(String id);
}
