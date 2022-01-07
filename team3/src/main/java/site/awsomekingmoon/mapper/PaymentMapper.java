package site.awsomekingmoon.mapper;

import java.util.List;
import java.util.Map;

import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.MemberVo;
import site.awsomekingmoon.domain.PaymentDTO;

/**
 * @author 김문수
 * 2021.11.03
 * 결제 정보 관련 클래스
 */
public interface PaymentMapper {
	/** 결제*/
	void payment(PaymentDTO dto);
}
