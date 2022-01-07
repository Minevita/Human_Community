package site.awsomekingmoon.service;

import java.util.List;

import site.awsomekingmoon.domain.ReplyCriteria;
import site.awsomekingmoon.domain.ReplyVO;



/**
 * @author 성지혜
 * 댓글 기능
 */
public interface ReplyService {
	/* 댓글 등록*/
	void register(ReplyVO vo);
	/* 댓글 */
	ReplyVO get(Long rno);
	/* 댓글 수정*/
	boolean modify(ReplyVO vo);
	/* 댓글 삭제*/
	boolean remove(Long rno);
	/* 댓글 목록*/
	List<ReplyVO> getList(ReplyCriteria cri,Long bno);
}
