package site.awsomekingmoon.mapper;

import java.util.List;

import site.awsomekingmoon.domain.AttachVo;
/**
 * @author 안병수
 * @첨부파일매퍼
 */
public interface AttachMapper {
	/**첨부파일 추가*/
	void insert(AttachVo vo);
	/**첨부파일 삭제*/
	void delete(String uuid);
	/**첨부파일 리스트*/
	List<AttachVo> findByBno(Long bno);
	/**uuid로 첨부파일 찾기*/
	AttachVo findBy(String uuid);
	/**전체삭제*/
	void deleteAll(Long bno);
	/**oldfile로 만들기*/
	List<AttachVo> getOldFiles();
	
}
