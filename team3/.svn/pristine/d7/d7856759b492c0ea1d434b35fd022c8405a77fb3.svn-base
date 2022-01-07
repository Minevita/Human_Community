package site.awsomekingmoon.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.service.MemberService;


/**
 * @author 박영준
 * MemberController
 */
@Controller @Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	@Autowired @Setter @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;

	/** @author 박영준 */
	@PreAuthorize("isAnonymous()")
	@GetMapping("type")
	public void join_type() {
		
	}

	/** @author 박영준 */
	@PreAuthorize("isAnonymous()")
	@GetMapping("send")
	public void join_sendAuth() {
		
	}

	/** @author 박영준 */
	@PreAuthorize("isAnonymous()")
	@PostMapping("send")
	public String join_sendAuth(@RequestParam Map<String, Object> map, RedirectAttributes rttr) {
		if(map.get("phone") != null || ((String) map.get("phone")).replace(" ", "") != null) {
			String key = service.createKey();
			map.put("authKey", key);
			
			log.warn("map :: " + map);
			
			service.sendMessage(map);
			System.out.println("run service :: sendMessage");
			service.insertAuthPhone(map);
			System.out.println("run service :: insertAuthPhone");
			
		}
		rttr.addAttribute("phone", (String) map.get("phone"));
		return "redirect:/member/confirm";
	}

	/** @author 박영준 */
	@PreAuthorize("isAnonymous()")
	@GetMapping("confirm")
	public void join_confirmAuth(@RequestParam("phone") String phone, Model model) {
		model.addAttribute("confirmPN", phone);
	}

	/** @author 박영준 */
	@PreAuthorize("isAnonymous()")
	@PostMapping("confirm")
	public String join_confirmAuth(@RequestParam Map<String, Object> map, RedirectAttributes rttr) {
		if(map.get("authKey") != null || ((String) map.get("authKey")).replace(" ", "") != null) {
			
			System.out.println(map);
			
			System.out.println(map.get("phone").getClass());
			
			if (service.confirmAuth(map)) {
				rttr.addAttribute("userPN", map.get("phone"));
				return "redirect:/member/register";
			} else {
				rttr.addFlashAttribute("result", "fail");
				return "redirect:/member/confirm";
			}
		} else {
			rttr.addFlashAttribute("result", "fail");
			return "redirect:/member/confirm";
		}
	}
	

	/** @author 박영준 */
	@PreAuthorize("isAnonymous()")
	@GetMapping("register")
	public void join_register(@RequestParam("userPN") String userPN, Model model) {
		model.addAttribute("phone", userPN);
	}

	/** @author 박영준 */
	@PreAuthorize("isAnonymous()")
	@PostMapping("register")
	public String join_register(@RequestParam Map<String, Object> map) {
		log.warn("join_register :: " + map);
		
		log.warn("join_register after encode :: " + map);
		
		service.register(map);
		
		return "/";
	}

	/** @author 박영준 */
	@RequestMapping(value="/idValid", method= RequestMethod.GET)
	public @ResponseBody void idValid(String id, HttpServletResponse resp) throws IOException {
		int result = service.get(id) == null ? 1 : 0;
		resp.getWriter().print(result);
	}

	/** @author 박영준 */
	@RequestMapping(value="/emailValid", method= RequestMethod.GET)
	public @ResponseBody void emailValid(String email, HttpServletResponse resp) throws IOException {
		int result = service.get(email) == null ? 1 : 0;
		resp.getWriter().print(result);
	}
	
	/** @author 박영준 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("identify")
	public void identify() {
		
	}
	
	/** @author 박영준 */
	@PreAuthorize("isAuthenticated()")
	@PostMapping("identify")
	public String identify(@RequestParam("pw") String pw, @RequestParam("ckPw") String ckPw, RedirectAttributes rttr) {
		log.warn(pw);
		
		if(encoder.matches(pw, ckPw)) {
			log.warn("success");
			return "redirect:/member/info";
		} else {
			log.warn("fail");
			rttr.addAttribute("result", "incorrect");
			return "redirect:/member/identify";
		}
	}
	
	/** @author 박영준 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("info")
	public void getMemberInfo() {
		
	}
	
	/** @author 박영준 */
	@PreAuthorize("isAuthenticated()")
	@PostMapping("info")
	public String getMemberInfo(@RequestParam Map<String, Object> map, RedirectAttributes rttr) {
		log.warn(map);
		
		if(service.modify(map)) {
			SecurityContextHolder.clearContext();
			return "redirect:/";
		}
		rttr.addFlashAttribute("result", "fail");
		return "redirect:/member/info";
	}
	
	/** @author 박영준 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("withdraw")
	public void withdraw() {
		
	}
	
	/** @author 박영준 */
	@PreAuthorize("isAuthenticated()")
	@PostMapping("withdraw")
	public String withdraw(@RequestParam("pw") String pw, @RequestParam("ckPw") String ckPw, @RequestParam("id") String id, RedirectAttributes rttr) {
		log.warn(pw);
		
		if(encoder.matches(pw, ckPw)) {
			
			log.warn("success");
			service.withdraw(id);
			SecurityContextHolder.clearContext();
			return "redirect:/";
			
		} else {
			
			log.warn("fail");
			rttr.addAttribute("result", "fail");
			return "redirect:/member/withdraw";
		}
	}
}
