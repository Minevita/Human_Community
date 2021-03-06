package site.awsomekingmoon.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * @author 김문수
 * 2021.10.22
 * 결제 관련 필드 생성
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
	/**
	 * @author 김문수
	 * 2021.10.22
	 * 결제 번호
	 */
	Long no;
	/**
	 * @author 김문수
	 * 2021.10.22
	 * 결제 날짜
	 */
	String date;
	/**
	 * @author 김문수
	 * 2021.10.22
	 * 결제 금액
	 */
	Long Pay;
	/**
	 * @author 김문수
	 * 2021.10.22
	 * 결제한 유저아이디
	 */
	String user;
	/**
	 * @author 김문수
	 * 2021.10.22
	 * 결제 상품 : 강좌명
	 */
	String product;
}
