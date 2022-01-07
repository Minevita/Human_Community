package site.awsomekingmoon.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.service.BoardService;

/**
 * @author 박영준
 * HomeController
 */
@Controller
@AllArgsConstructor
public class HomeController {
	private BoardService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		// 공지사항
		model.addAttribute("notice", service.findByCategory(1L));
		// Q&A
		model.addAttribute("qa", service.findByCategory(6L));
		// 자유게시판(나중에 댓글 수로 정렬하는 실시간 게시판으로 교체)
		model.addAttribute("free", service.findByCategory(4L));
		// 서적리뷰
		model.addAttribute("review", service.findByCategory(3L));
		// IT News & 정보
		model.addAttribute("info", service.findByCategory(5L));
		// 중고장터
		model.addAttribute("market", service.findByCategory(7L));
		
		return "home2";
	}
	
}
