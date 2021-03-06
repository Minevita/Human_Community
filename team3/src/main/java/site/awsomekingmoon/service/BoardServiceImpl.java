package site.awsomekingmoon.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import site.awsomekingmoon.domain.AttachVo;
import site.awsomekingmoon.domain.BoardVo;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.UsedMKVO;
import site.awsomekingmoon.mapper.AttachMapper;
import site.awsomekingmoon.mapper.BoardMapper;
import site.awsomekingmoon.mapper.UsedMKMapper;

/**
 * @author 안병수
 * @게시판기능impl
 */
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	private BoardMapper boardMapper;
	private AttachMapper attachMapper;
	private UsedMKMapper usedMKMapper;
	
	@Override @Transactional
	public void register(BoardVo boardVo) {
		boardMapper.insertSelectKey(boardVo);
		if(boardVo.getCategory().equals(7L)) {
			boardVo.getUsedMKs().forEach(umk->{
				umk.setBno(boardVo.getBno());
				usedMKMapper.insert(umk);
			});
		}
		boardVo.getAttachs().forEach(attach->{
			attach.setBno(boardVo.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardVo get(Long bno) {
		return boardMapper.read(bno);
	}

	@Override @Transactional
	public boolean modify(BoardVo boardVo) {
		boolean result = boardMapper.update(boardVo) > 0;
		
		attachMapper.deleteAll(boardVo.getBno());
		usedMKMapper.delete(boardVo.getBno());
		if(result) {
			boardVo.getAttachs().forEach(vo->{
				vo.setBno(boardVo.getBno());
				attachMapper.insert(vo);
			});
			boardVo.getUsedMKs().forEach(vo->{
				vo.setBno(boardVo.getBno());
				usedMKMapper.insert(vo);
			});
		}
		
		
		return boardMapper.update(boardVo) > 0;
	}

	@Override @Transactional
	public boolean remove(Long bno) {
		attachMapper.deleteAll(bno);
		usedMKMapper.delete(bno);
		return boardMapper.delete(bno) > 0;
	}

	@Override
	public List<BoardVo> getList(Criteria cri) {
		List<BoardVo> list = boardMapper.getListWithPaging(cri);
		list.forEach(vo -> vo.setAttachs(attachMapper.findByBno(vo.getBno())));
		list.forEach(vo -> vo.setUsedMKs(usedMKMapper.findByBno(vo.getBno())));
		return list;
	}

	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public List<AttachVo> getAttachs(Long bno) {
		return attachMapper.findByBno(bno);
	}

	@Override
	public List<UsedMKVO> getUMKs(Long bno) {
		return usedMKMapper.findByBno(bno);
	}

	@Override
	public List<BoardVo> findByCategory(Long bno) {
		return boardMapper.findByCategory(bno);
	}

	@Override
	public List<BoardVo> getList2() {
		return boardMapper.getList2();
	}

}
