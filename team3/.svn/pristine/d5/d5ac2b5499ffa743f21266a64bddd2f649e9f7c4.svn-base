package site.awsomekingmoon.mapper;

import java.util.List;

import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.LectureVO;

/**
 * @author 이창연
 * 강좌 페이지
 */
public interface LectureMapper {
	/** 강좌리스트 출력 */
	List<LectureVO> getLecture();
	/** 강좌 추가 */
	void insert(LectureVO lecture);
	/** 강좌 추가(시퀀스) */
	void insertSelectKey(LectureVO lecture);
	/** 강좌 조회 */
	LectureVO read(Long lno);
	/** 강좌 변경 */
	int update(LectureVO lecture);
	/** 강좌 삭제 */
	int delete(Long bno);
	/** 강좌 리스트(페이징) */
	List<LectureVO> getLectureWithPaging(Criteria cri);
	/** 강좌 총 갯수 */
	int getTotalCount(Criteria cri);
}
