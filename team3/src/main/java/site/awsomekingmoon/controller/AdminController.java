package site.awsomekingmoon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.GetProxy;
import oracle.jdbc.proxy.annotation.Post;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.PageDTO;
import site.awsomekingmoon.service.BoardService;
import site.awsomekingmoon.service.BoardServiceImpl;
import site.awsomekingmoon.service.MemberService;


/**
 * @author 김문수
 * 2021.10.30
 * 관리자 페이지 기능
 */
@Controller @Log4j
@AllArgsConstructor
public class AdminController {
	private BoardService service;
	private MemberService memberService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')") 
	@GetMapping("adminPage")
	public void adminLogin(Model model, Criteria cri){
		model.addAttribute("list", service.getList2());
		model.addAttribute("page", new PageDTO(service.getTotal(cri), cri));
	}
	
	/**리스트*/
	@PreAuthorize("hasRole('ROLE_ADMIN')") 
	@GetMapping("member/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", memberService.memberList(cri));
		model.addAttribute("page", new PageDTO(memberService.memberCount(cri), cri));
	}
	
//	@GetMapping("payment/payment")
//	public void paymentForm(){
//	}
//	
//	@PostMapping("payment/payment")
//	public void payment(@RequestParam Map<String, Object> map, RedirectAttributes rttr){
//		
//	}
}

