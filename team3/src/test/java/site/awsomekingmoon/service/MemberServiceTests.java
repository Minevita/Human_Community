package site.awsomekingmoon.service;

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

/**
 * @author 김문수, 박영준
 * 2021.11.01 
 * 회원 정보의 생성, 조회, 수정, 삭제 서비스 테스트 클래스 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {
	@Autowired @Setter
	private MemberService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testMemberList() {
		service.memberList(new Criteria()).forEach(log::info);
	}
	
	@Test
	public void testMemberCount() {
		log.info(service.memberCount(new Criteria()));
	}
	
	/**
	 * @author 박영준
	 * 회원 가입 테스트
	 */
	@Test
	public void testRegister() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", "user15");
		map.put("pw", "1234");
		map.put("email", "user15@gmail.com");
		map.put("name", "킹영준");
		map.put("nickname", "일반사용자15");
		map.put("phone", "01015151515");
		map.put("auth", "ROLE_USER");
		
		service.register(map);
		
		log.info(service.get("user15"));
	}
	
	/**
	 * @author 박영준
	 * 회원정보 조회 테스트
	 */
	@Test
	public void testGet() {
		log.info(service.get("user15"));
	}
	
	/**
	 * @author 박영준
	 * 회원정보 수정 테스트
	 */
	@Test
	public void testModify() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "user0");
		map.put("name", "박영준");
//		unique
		map.put("nickname", "일반사용자0");
//		unique
		map.put("email", "user0@gmail.com");
//		unique
		map.put("phone", "01012345670");
		
		log.info(service.get("user0"));
		
	}
	
	/**
	 * @author 박영준
	 * 회원 탈퇴 테스트
	 */
	@Test
	public void testWithdraw() {
		service.withdraw("user0");
		log.info(service.get("user0"));
	}
	
	/**
	 * @author 박영준
	 * 문자 보내기 테스트
	 */
	@Test
	public void testSendMessage() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", "테스트 받을 핸드폰번호 입력");
		map.put("authKey", service.createKey());
	}
	
	/**
	 * @author 박영준
	 * 랜덤인증번호 생성 테스트
	 */
	@Test
	public void testCreateKey() {
		log.info(service.createKey());
	}
	
	/**
	 * @author 박영준
	 * 인증번호 저장 테스트
	 */
	@Test
	public void testInsertAuthPhone() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", "01010220721");
		map.put("authKey", "w95121");
		
		log.info("authInfo :: " + map);
		
		service.insertAuthPhone(map);
	}
	
	/**
	 * @author 박영준
	 * 인증번호 확인 테스트
	 */
	@Test
	public void testConfirmAuth() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", "01010220721");
		map.put("authKey", "w95121");
		
		log.info("result :: " + service.confirmAuth(map));
	}
}
