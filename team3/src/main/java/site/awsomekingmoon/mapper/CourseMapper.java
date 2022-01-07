package site.awsomekingmoon.mapper;

import java.util.List;

import site.awsomekingmoon.domain.CourseVO;
import site.awsomekingmoon.domain.LectureVO;

/**
 * @author 이창연
 * 강의 페이지
 */
public interface CourseMapper {
	/** 강의 추가 */
	void insert(CourseVO course);
	/** 강의 추가(시퀀스) */
	void insertSelectKey(CourseVO course);
	/** 강의 조회 */
	LectureVO read(Long cno);
	/** 강의 변경 */
	int update(CourseVO course);
	/** 강의 삭제 */
	int delete(Long cno);
	/** 강의 전체 삭제 */
	int deleteAll(Long lno);
	/** 강의 리스트*/
	List<CourseVO> findByLno(Long lno);
}
