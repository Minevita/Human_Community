package site.awsomekingmoon.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author 안병수
 * @게시판 리스트 표시
 */
@Data @AllArgsConstructor
public class Criteria {
	/**게시판 페이지 */
	private int pageNum;
	/**한번에 표시될 게시글의 수 */
	private int amount;
	/** */
	private String type;
	/**한번에 표시될 게시글의 수 */
	private String keyword;
	/**게시판 카테고리*/
	private int category;
	/**페이지 기준*/
	public Criteria() {
		this(1, 10);
	}
	/**페이지 번호*/
	public Criteria(int pageNum) {
		super();
		this.pageNum = pageNum;
	}
	/**기준 페이지에서 표시될 양*/
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public Criteria(int pageNum, int amount, int category) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
	}
	
	/**type get*/
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	/**url에서 pageNum, amount, type, keyword가져오기*/
	public String getParams() {
		return UriComponentsBuilder.newInstance()
				.queryParam("pageNum", pageNum)
				.queryParam("amount", amount)
				.queryParam("category", category)
				.queryParam("type", type)
				.queryParam("keyword", keyword)
				.build().toString();
	}
	
	public static void main(String[] args) {
		int[] arr = {1,2,3,4,5,6,7};
		for(int i : arr) {
			System.out.printf("%d %d %d %n", i, i/3, (i-1) % 3, i - ((i-1) % 3) - 1 + 2);
		}
	}
}