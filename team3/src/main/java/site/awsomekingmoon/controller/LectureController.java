package site.awsomekingmoon.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.CourseVO;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.LectureVO;
import site.awsomekingmoon.domain.PageDTO;
import site.awsomekingmoon.service.LectureService;

@Controller
@Log4j
@RequestMapping("/lecture/*")
@AllArgsConstructor
public class LectureController {
	private LectureService service;
	private CourseController courseController;
	
	/** 강좌 리스트 */
	@GetMapping("list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("page", new PageDTO(service.getTotal(cri), cri));
	}
	/** 강좌 등록 Post */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("register")
	public String register(LectureVO lecture, RedirectAttributes rttr) {
		log.info("register :: " + lecture);
		service.register(lecture);
		log.info("register :: " + lecture);
		rttr.addFlashAttribute("result", lecture.getLno());
		return "redirect:/lecture/list";
	}
	/** 수정 Get */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping({"get", "modify"})
	public void get(@RequestParam("lno") Long lno, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("get");
		model.addAttribute("board", service.get(lno));
	}
	/** 수정 Post */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("modify")
	public String modify(LectureVO lecture, RedirectAttributes rttr, Criteria cri) {
		log.info("modify :: " + lecture);
		if(service.modify(lecture)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("category", cri.getCategory());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/lecture/list";
	}
	/** 강의 삭제 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("remove")
	public String remove(@RequestParam("lno") Long lno, RedirectAttributes rttr, Criteria cri) {
		log.info("remove :: " + lno);
		List<CourseVO> list = service.getCourses(lno);
		if(service.remove(lno)) {
			list.forEach(course-> {
				courseController.deleteCourses(course.getLno());
			});
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("category", cri.getCategory());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/lecture/list";
	}
	/** 강의리스트 Get */
	@GetMapping("getCourses/{lno}")
	public @ResponseBody List<CourseVO> getCourses(@PathVariable Long lno) {
		return service.getCourses(lno);
	}
}
