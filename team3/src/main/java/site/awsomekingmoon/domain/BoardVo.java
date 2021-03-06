package site.awsomekingmoon.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;

/**
 * @author 안병수
 * @게시판 기본 정의 
 */
@Data @Alias("board")
public class BoardVo {
	/** 게시판 글 번호*/
	private Long bno;
	/** 게시판 글 제목*/
	private String title;
	/** 게시판 글 내용*/
	private String content;
	/** 게시판 글 작성자*/
	private String writer;
	/** 게시판 글 작성자 닉네임*/
	private String nickname;
	/** 게시판 글 작성일*/
	private Date regDate;
	/** 게시판 글 수정일*/
	private Date updateDate;
	/** 게시판 카테고리 번호*/
	private Long category;
	/** 게시판 댓글 수 */
	private int replyCnt;
	/** 게시판 조회 수*/
	private int see;
	/** 게시판 세이브 여부 자동저장 구현용*/
	private boolean isSaved;
	/**첨부파일 리스트*/
	@Autowired
	private List<AttachVo> attachs = new ArrayList<>();
	@Autowired
	private List<UsedMKVO> usedMKs = new ArrayList<>();
}