package site.awsomekingmoon.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.BoardVo;
import site.awsomekingmoon.domain.PaymentDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PaymentMapperTests {
	
	@Setter @Autowired
	private PaymentMapper mapper;
	
	@Test
	public void testExist(){
		assertNotNull(mapper);
	}
	
	@Test
	public void testInsert() {
		PaymentDTO dto = new PaymentDTO();
		dto.setPay(25000L);
		dto.setUser("user3");
		dto.setProduct("테스트 강좌");
		mapper.payment(dto);
	}	
	
}
