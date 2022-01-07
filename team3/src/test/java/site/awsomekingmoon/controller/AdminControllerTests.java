package site.awsomekingmoon.controller;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.PageDTO;

/**
 * @author 김문수
 * 2021.11.04
 * 관리자 기능 컨트롤 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class AdminControllerTests {
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
	
	@Test
	@WithMockUser(roles = "ADMIN")
	public void testAdminPage() throws Exception{
		mvc.perform(get("/adminPage"));
	}
	
	@Test
	@WithMockUser(roles = "ADMIN")
	public void testNewList() throws Exception{
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/adminPage")
				.param("pageNum", "1")
				.param("amount", "1")
				)
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		List<?> list = (List<?>)map.get("list");
		list.forEach(log::info);
	}
	
	@Test
	@WithMockUser(roles = "ADMIN")
	public void testMemberList() throws Exception{
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/member/list")
				.param("pageNum", "1")
				.param("amount", "10")
				)
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		List<?> list = (List<?>)map.get("list");
		list.forEach(log::info);
	}
}
