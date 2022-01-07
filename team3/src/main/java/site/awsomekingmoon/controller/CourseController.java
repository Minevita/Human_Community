package site.awsomekingmoon.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.CourseDTO;
import site.awsomekingmoon.mapper.CourseMapper;
/**
 * @author 이창연
 * 판매글 정보 컨트롤러 
 */
@Controller @Log4j
public class CourseController {
	@Setter @Autowired
	private CourseMapper courseMapper;
	
	@PostMapping("uploadCourse")
	public @ResponseBody List<CourseDTO> upload(CourseDTO csdto) {
		List<CourseDTO> list = new ArrayList<>();
		CourseDTO dto = new CourseDTO(csdto.getCno(), csdto.getUrl());
		log.info(dto);
		list.add(dto);
		return list;
	}
	
	@PostMapping("deleteCourse")
	public @ResponseBody void deleteCourses(Long lno) {
		courseMapper.deleteAll(lno);
	}
	
}
