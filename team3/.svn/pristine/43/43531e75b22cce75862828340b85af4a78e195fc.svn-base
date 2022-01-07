package site.awsomekingmoon.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.BoardVo;
import site.awsomekingmoon.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter @Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(log::info);
//		mapper.getList();
	}
	@Test
	public void testGetCategory() {
		mapper.findByCategory(1L).forEach(log::info);
	}
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria();
		cri.setType("TC");
		cri.setKeyword("내용");
		
		mapper.getListWithPaging(cri).forEach(log::info);
	}
	@Test
	public void testInsert() {
		BoardVo board = new BoardVo();
		board.setTitle("영속 테스트 제목");
		board.setContent("영속 테스트 내용");
		board.setNickname("admin9");
		board.setCategory(1L);
		mapper.insert(board);
	}	
	@Test
	public void testInsertSelectKey() {
		BoardVo board = new BoardVo();
		board.setTitle("영속 테스트 제목 - 셀렉트키");
		board.setContent("영속 테스트 내용");
		board.setNickname("tester");
		board.setCategory(1L);
		log.info("before :: " + board);
		mapper.insertSelectKey(board);
		log.info("after :: " + board);
	}
	@Test
	public void testRead() {
		log.info(mapper.read(1L));
	}
	@Test
	public void testUpdate() {
		BoardVo board = new BoardVo();
		board.setTitle("수정된 영속 테스트 제목");
		board.setContent("수정된 테스트 내용");
		board.setNickname("tester");
		board.setCategory(1L);
		board.setBno(1L);
		log.info(mapper.update(board));
		log.info(mapper.read(1L));
	}
	@Test
	public void testDelete() {
		log.info(mapper.read(2L));
		log.info(mapper.delete(2L));
		log.info(mapper.read(2L));
	}
	
	@Test
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
		cri.setType("T");
		cri.setKeyword("수정된");
		log.info(mapper.getTotalCount(cri));
	}
}
