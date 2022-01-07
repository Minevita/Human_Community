package site.awsomekingmoon.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 이창연
 * 2021.10.25
 * 강좌게시판 관련 필드 생성
 */
@Getter @Setter @ToString(callSuper=true) @Alias("lecture")
public class LectureVO {
	/** 강좌 번호 */
	Long lno;
	/** 강사 이름 */
	String writer;
	/** 강좌 이름 */
	String title;
	/** 강좌 소개 */
	String content;
	/** 강좌 등록일 */
	Date regDate;
	/** 강좌 수정일 */
	Date updateDate;
	/** 강좌 가격 */
	int price;
	/** 강좌 평점 */
	double grade;
	
	private List<CourseVO> courses = new ArrayList<>();
}
