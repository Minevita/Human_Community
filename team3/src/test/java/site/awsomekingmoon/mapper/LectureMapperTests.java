package site.awsomekingmoon.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LectureMapperTests {
	@Autowired @Setter
	private LectureMapper mapper;
	
	@Test
	public void testExist() {
		log.info("Exist");
		assertNotNull(mapper);
	}
	
	@Test
	public void testGetLecture() {
		log.info("GetLecture");
		log.info(mapper.getLecture());
	}
	
	@Test
	public void testGetLectureWithPaging() {
		log.info("GetLectureWithPaging");
		log.info(mapper.getLectureWithPaging(new Criteria()));
	}
	
	@Test
	public void testInsert() {
		log.info("Insert");
		
	}
	
	@Test
	public void testInsertSelectKey() {
		log.info("InsertSelectKey");
		
	}
	
	@Test
	public void testRead() {
		log.info("Read");
		
	}
	
	@Test
	public void testUpdate() {
		log.info("Update");
		
	}
	
	@Test
	public void testDelete() {
		log.info("Delete");
		
	}
	
	@Test
	public void testGetTotalCount() {
		log.info("GetTotalCount");
		
	}
}
