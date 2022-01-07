package site.awsomekingmoon.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 이창연
 * 2021.10.25
 * 중고장터 관련 필드 생성
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsedMKDTO {
	/** 판매 상태 (false : 판매중, true : 판매완료)*/
	boolean status;
	/** 판매자 위치(경도) */
	double longitude;
	/** 판매자 위치(위도) */
	double latitude;
	
	public UsedMKDTO(double longitude, double latitude) {
		super();
		this.longitude = longitude;
		this.latitude = latitude;
	}
	
}
