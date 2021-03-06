package site.awsomekingmoon.domain;

import lombok.Getter;
import lombok.ToString;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.PageDTO;

/**
 * @author 안병수
 * @게시판 리스트 표시
 */
@Getter @ToString
public class PageDTO {
	/**게시글에 표시될 페이지의 수*/
	private static int PAGE_AMOUNT = 10;
	/**전체 페이지 수*/
	private int total;
	/**기준 페이지*/
	private Criteria cri;
	/**카테고리*/
	private Long category;
	/**시작 페이지*/
	private int startPage;
	/**마지막 페이지*/
	private int endPage;
	/**앞페이지 유무*/
	private boolean prev;
	/**다음페이지 유무*/
	private boolean next;
	/**앞페이지 유무*/
	public PageDTO() {
	}
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		endPage = ((cri.getPageNum() - 1) / PAGE_AMOUNT + 1) * PAGE_AMOUNT;
		startPage = endPage - PAGE_AMOUNT + 1;
		
		int realEnd = (total + cri.getAmount() - 1) / cri.getAmount();
		
		endPage = realEnd < endPage ? realEnd : endPage ;
		
		prev = startPage > 1;
		next = endPage < realEnd;	
	}
	public static void main(String[] args) {
		System.out.println(new PageDTO(220000, new Criteria(1, 10)));
	}
}
