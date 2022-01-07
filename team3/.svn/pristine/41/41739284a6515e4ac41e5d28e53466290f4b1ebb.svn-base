package site.awsomekingmoon.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import site.awsomekingmoon.domain.CourseVO;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.LectureVO;
import site.awsomekingmoon.mapper.CourseMapper;
import site.awsomekingmoon.mapper.LectureMapper;

@Service
@AllArgsConstructor
public class LectureServiceImpl implements LectureService {
	private LectureMapper lectureMapper;
	private CourseMapper courseMapper;
	
	@Override @Transactional
	public void register(LectureVO lecture) {
		lectureMapper.insert(lecture);
	}
	@Override
	public LectureVO get(Long lno) {
		return lectureMapper.read(lno);
	}
	@Override @Transactional
	public boolean modify(LectureVO lecture) {
		boolean result = lectureMapper.update(lecture) > 0;
		
		courseMapper.deleteAll(lecture.getLno());
		if(result) {
			lecture.getCourses().forEach(course->{
				course.setLno(course.getLno());
				courseMapper.insert(course);
			});
		}
		return result;
	}
	@Override @Transactional
	public boolean remove(Long lno) {
		courseMapper.deleteAll(lno);
		lectureMapper.delete(lno);
		return lectureMapper.delete(lno) > 0;
	}
	@Override
	public List<LectureVO> getList(Criteria cri) {
		List<LectureVO> list = lectureMapper.getLectureWithPaging(cri);
		list.forEach(course -> course.setCourses(courseMapper.findByLno(course.getLno())));
		return list;
	}
	@Override
	public int getTotal(Criteria cri) {
		return lectureMapper.getTotalCount(cri);
	}
	@Override
	public List<CourseVO> getCourses(Long lno) {
		return courseMapper.findByLno(lno);
	}
	
	
}
