package site.awsomekingmoon.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.MemberVo;


/**
 * @author 박영준, 김문수
 * MemberMapperTests 회원 조회 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	@Autowired @Setter
	private MemberMapper memberMapper;
	
	@Test
	public void testExist(){
		assertNotNull(memberMapper);
	}
	
	/**
	 * @author 박영준
	 * 회원정보 불러오기
	 */
	@Test
	public void testRead() {
		MemberVo vo = memberMapper.read("user1");
		MemberVo vo1 = memberMapper.read("member7");
		MemberVo vo2 = memberMapper.read("admin9");
		log.info(vo);
		log.info(vo1);
		log.info(vo2);
//		vo.getAuths().forEach(log::info);
	}
	
	@Test
	public void testGetList(){
		memberMapper.memberList().forEach(log::info);
	}
	
	@Test
	public void testGetMemberCount(){
		Criteria cri = new Criteria();
		cri.setType("I");
		cri.setKeyword("user");
		log.info(memberMapper.getMemberCount(cri));
	}
	
	/**
	 * @author 박영준
	 * 회원가입
	 */
	@Test
	public void testInsertMember() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "user15");
		map.put("pw", "1234");
		map.put("email", "user15@gmail.com");
		map.put("name", "킹영준");
		map.put("nickname", "일반사용자15");
		map.put("phone", "01015151515");
		
		log.info(map);
		
		memberMapper.insertMember(map);
		
		log.info("after insert :: " + memberMapper.read("user15"));
	}
	

	/**
	 * @author 박영준
	 * 회원가입 후 security 권한 부여
	 */
	@Test
	public void testInsertAuth() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "user15");
		map.put("auth", "ROLE_USER");
		
		log.info(map);
	}
	
	/**
	 * @author 박영준
	 * 핸드폰 인증번호, 핸드폰 번호, 만료시간(시스템시간+3분) DB저장
	 */
	@Test
	public void testInsertAuthPhone() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", "01010220721");
		map.put("authKey", "w95121");
		
		log.info("authInfo :: " + map);
		memberMapper.insertAuthPhone(map);
	}
	
	/**
	 * @author 박영준
	 * VIEW에서 입력한 인증번호가 DB에 저장된 인증번호 일치하고
	 * 3분 이내(EXP-SYSDATE > 0)에 완료됐으면 1 반환
	 */
	@Test
	public void tsetConfirmAuth() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", "01010220721");
		map.put("authKey", "w95121");
		
		log.info("result :: " + memberMapper.confirmAuth(map));
	}
	
	/**
	 * @author 박영준
	 * 회원정보 수정 전 자식 테이블(보드) 수정
	 */
	@Test
	public void testModifyChild() {
		Map<String, Object> map = new HashMap<String, Object>();
		//SET
		map.put("nickname", "일반사용자0");
		//WHERE
		map.put("id", "user0");
		
		memberMapper.modifyChild(map);
	}
	
	/**
	 * @author 박영준
	 * 회원정보 수정
	 */
	@Test
	public void testModify() {
		Map<String, Object> map = new HashMap<String, Object>();
		//SET
		
		map.put("name", "박영준");
		
		//	unique
		map.put("nickname", "일반사용자0");
		//	unique
		map.put("email", "user0@gmail.com");
		//	unique
		map.put("phone", "01012345670");
		
		//WHERE
		map.put("id", "user0");
		
		log.info("inputMap :: " + map);
		
		log.info("before :: " + memberMapper.read("user0"));
		
		memberMapper.modify(map);
		
		log.info("aftre :: " + memberMapper.read("user0"));
	}
	
	/**
	 * @author 박영준
	 * 회원 탈퇴(UPDATE) - 권한 수정
	 */
	@Test
	public void testWithdrawAuth() {
		memberMapper.withdrawAuth("user0");
	}
	
	/**
	 * @author 박영준
	 * 회원 탈퇴(UPDATE, 회원 테이블 STATUS -> 0)
	 */
	@Test
	public void testWithdraw() {
		memberMapper.withdraw("user0");
	}
	
}

