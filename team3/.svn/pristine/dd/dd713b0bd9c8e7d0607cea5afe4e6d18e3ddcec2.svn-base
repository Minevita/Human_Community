package site.awsomekingmoon.service;

import java.util.List;

import site.awsomekingmoon.domain.CourseVO;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.LectureVO;

/**
 * @author 이창연
 * 강좌게시판 기능
 */
public interface LectureService {
	/** 강좌 등록 */
	void register(LectureVO lecture);
	/** 강좌 조회 */
	LectureVO get(Long lno);
	/** 강좌 수정 */
	boolean modify(LectureVO lecture);
	/** 강좌 삭제 */
	boolean remove(Long lno);
	/** 강좌 목록 */
	List<LectureVO> getList(Criteria cri);
	/** 강좌 총 갯수 */
	int getTotal(Criteria cri);
	/** 강의 리스트 */
	List<CourseVO> getCourses(Long lno);
}
