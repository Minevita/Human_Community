package site.awsomekingmoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.awsomekingmoon.domain.ReplyCriteria;
import site.awsomekingmoon.domain.ReplyVO;

public interface LReplyMapper {
	int insert(ReplyVO vo);
	ReplyVO read(Long rno);
	int update(ReplyVO vo);
	int delete(Long rno);
	List<ReplyVO> getList(@Param("bno") Long bno,@Param("cri") ReplyCriteria cri);
}

