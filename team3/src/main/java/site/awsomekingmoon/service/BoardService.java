package site.awsomekingmoon.service;

import java.util.List;

import site.awsomekingmoon.domain.AttachVo;
import site.awsomekingmoon.domain.BoardVo;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.UsedMKVO;

/**
 * @author 안병수
 * @게시판기능
 */
public interface BoardService {
	/**작성*/
	void register(BoardVo boardVo);
	/**게시글*/
	BoardVo get(Long bno);
	/**수정*/
	boolean modify(BoardVo boardVo);
	/**삭제*/
	boolean remove(Long bno);
	/**리스트*/
	List<BoardVo> getList(Criteria cri);
	/**
	 * @author 김문수
	 * adminPage 게시판용
	 */
	List<BoardVo> getList2();
	/**게시글 전체*/
	int getTotal(Criteria cri);
	/**첨부파일 리스트*/
	List<AttachVo> getAttachs(Long bno);
	/**게시글 리스트*/
	List<BoardVo> findByCategory(Long category);
	/** 판매글 정보 리스트*/
	List<UsedMKVO> getUMKs(Long bno);
}
