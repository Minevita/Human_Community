package site.awsomekingmoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.service.BoardService;


/**
 * @author 박영준
 * CommonController
 */
@Controller @Log4j
@AllArgsConstructor
public class CommonController {
	private BoardService service;
	
	@RequestMapping(value="customLogin", method={RequestMethod.GET ,RequestMethod.POST})
	public String login(String error, String logout, Model model) {
		log.info("error : " + error);
		
		if(error != null) {
			model.addAttribute("error", "login error check your account");
		}
		return "/common/login";
	}
}
