package site.awsomekingmoon.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import site.awsomekingmoon.domain.ReplyCriteria;
import site.awsomekingmoon.domain.ReplyVO;
import site.awsomekingmoon.mapper.BoardMapper;
import site.awsomekingmoon.mapper.ReplyMapper;

	@Service
	@AllArgsConstructor
	public class ReplyServiceImpl implements ReplyService {

		private ReplyMapper mapper;
		private BoardMapper boardmapper;

		@Override
		@Transactional
		public void register(ReplyVO vo) {
			boardmapper.updateReplyCnt(vo.getBno(), 1);
			mapper.insert(vo);
		}

		@Override
		public ReplyVO get(Long rno) {
			return mapper.read(rno);
		}

		@Override
		public boolean modify(ReplyVO vo) {
			return mapper.update(vo) > 0;
		}

		@Transactional
		@Override
		public boolean remove(Long rno) {
			boardmapper.updateReplyCnt(get(rno).getBno(), -1);
			return mapper.delete(rno) > 0;
		}

		@Override
		public List<ReplyVO> getList(ReplyCriteria cri, Long bno) {
			return mapper.getList(bno, cri);
		}

	}

