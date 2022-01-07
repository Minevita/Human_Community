package site.awsomekingmoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.awsomekingmoon.domain.BoardVo;
import site.awsomekingmoon.domain.Criteria;

/**
 * @author 안병수
 * @BoardMapper
 */
public interface BoardMapper {
	/**게시판 출력*/
	List<BoardVo> getList();
	/**
	 * @author 김문수
	 * adminPage 출력용
	 */
	List<BoardVo> getList2();
	/**페이지에 따른 게시판 출력*/
	List<BoardVo> getListWithPaging(Criteria cri);
	
	List<BoardVo> getListWithPaging(Criteria cri, Long category);
	/**게시판 추가*/
	void insert(BoardVo board);
	/**BoardVo추가*/
	void insertSelectKey(BoardVo board);
	/**BoardVo추가*/
	BoardVo read(Long bno);
	/**게시판 변경*/
	int update(BoardVo boardVo);
	/**게시판 삭제*/
	int delete(Long bno);
	/**카테고리로 찾기*/
	List<BoardVo> findByCategory(Long category);
	/**전체 게시글 수*/
	int getTotalCount(Criteria cri);
	/**전체 댓글 수 */
	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
