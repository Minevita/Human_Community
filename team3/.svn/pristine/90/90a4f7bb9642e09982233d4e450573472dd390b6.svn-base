package site.awsomekingmoon.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.mapper.MemberMapper;
import site.awsomekingmoon.security.MemberTests;


/**
 * @author 박영준
 * MemberTests 회원데이터 생성 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	@Autowired @Setter @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	@Autowired @Setter
	private MemberMapper memberMapper;
	
	private List<Map<String, Object>> members = new ArrayList<>();
	
	@Before
	public void init() {
		for(int i = 0 ; i < 10 ; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pw", encoder.encode("1234"));
			
			if(i < 7) {
				map.put("id", "user"+i);
				map.put("nickname", "일반사용자"+i);
				map.put("auth", "ROLE_USER");
				map.put("email", "user"+i+"@gmail.com");
				map.put("phone", "0101234567"+i);
				map.put("status", "1");
			}
			else if(i < 9) {
				map.put("id", "member"+i);
				map.put("nickname", "회원"+i);
				map.put("auth", "ROLE_MEMBER");
				map.put("email", "member"+i+"@gmail.com");
				map.put("phone", "0101234568"+i);
				map.put("status", "1");
			}
			else {
				map.put("id", "admin"+i);
				map.put("nickname", "관리자"+i);
				map.put("auth", "ROLE_ADMIN");
				map.put("email", "admin"+i+"@gmail.com");
				map.put("phone", "0101234569"+i);
				map.put("status", "2");
			}
			members.add(map);
		}
		
	}
	
	// member
	@Test
	public void testInsert() {
		members.forEach(m->memberMapper.insertMember(m));
	}
	
	// auth
	@Test
	public void testAuth() {
		members.forEach(m->memberMapper.insertAuth(m));
	}
	
	// 통합
	@Test
	public void testAuth2() {
		List<Map<String, Object>> list = new ArrayList<>();
		for(int i = 90 ; i < 100 ; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userid", "admin"+i);
			map.put("auth", "ROLE_MEMBER");
			list.add(map);
		}
		list.forEach(m->memberMapper.insertAuth(m));
	}
}
