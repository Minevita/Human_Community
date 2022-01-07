package site.awsomekingmoon.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.ReplyCriteria;
import site.awsomekingmoon.domain.ReplyVO;
import site.awsomekingmoon.service.ReplyService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {
	@Setter @Autowired
	private ReplyService service;
	
	@Test
	public void testExist(){
		assertNotNull(service);
	}
	
	@Test
	public void testGetList(){
		service.getList(new ReplyCriteria(),1L).forEach(log::info);
	}
	
	@Test
	public void testReigster(){
		ReplyVO ReplyVO = new ReplyVO();
		ReplyVO.setReply("서비스 테스트 등록글 제목4");
		ReplyVO.setWriter("tester");
		ReplyVO.setBno(1L);
		service.register(ReplyVO);
	}
	
	@Test
	public void testGet(){
		log.info(service.get(1L));
	}
	
	@Test
	public void testModify(){
		ReplyVO ReplyVO = new ReplyVO();
		ReplyVO.setReply("서비스 테스트 수정글 제목");
		ReplyVO.setWriter("tester");
		ReplyVO.setRno(3L);
		service.modify(ReplyVO);
	}
	
	@Test
	public void testRemove(){
		log.info(service.remove(4L));
	}
	
	
}
