package site.awsomekingmoon.domain;

import lombok.AllArgsConstructor;
import lombok.Data;



/**
 * @author 성지혜
 *	ReplyCriteria 생성 
 */
@Data @AllArgsConstructor
public class ReplyCriteria extends Criteria{
	private long lastRno;
	
	public ReplyCriteria() {
		this(10);
	}
	
	public ReplyCriteria(int amount){
		setAmount(amount);
	}
	
	public ReplyCriteria(Long lastBno, int amount) {
		this(lastBno);
		setAmount(amount);
	}
}
