package site.awsomekingmoon.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.UsedMKVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsedMKMapperTests {
	@Setter @Autowired
	private UsedMKMapper mapper;
	
	@Test
	public void testExist() {
		log.info("Exist");
		assertNotNull(mapper);
	}
	
	@Test
	public void testInsert() {
		log.info("Insert");
		UsedMKVO vo = new UsedMKVO();
		vo.setLongitude(126.934624808088);
		vo.setLatitude(37.5011766129409);
		vo.setBno(127L);
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		log.info("Read");
		UsedMKVO vo = new UsedMKVO();
		vo.setBno(127L);
		mapper.findByBno(vo.getBno());
	}
	
	@Test
	public void testUpdate() {
		log.info("Update");
		UsedMKVO vo = new UsedMKVO();
		vo.setStatus(true);
		vo.setLongitude(126.845080612826);
		vo.setLatitude(37.5450814671158);
		vo.setBno(265L);
		mapper.update(vo);
	}
	
	@Test
	public void testDelete() {
		log.info("Delete");
		UsedMKVO vo = new UsedMKVO();
		vo.setBno(127L);
		mapper.delete(vo.getBno());
	}
}
