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
import site.awsomekingmoon.domain.AttachVo;
import site.awsomekingmoon.domain.BoardVo;
import site.awsomekingmoon.domain.Criteria;
import site.awsomekingmoon.domain.PageDTO;
import site.awsomekingmoon.domain.UsedMKVO;
import site.awsomekingmoon.service.BoardService;

/**
 * @author 안병수
 * @게시판컨트롤러 
 */
@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	private UploadController uploadController;
	private UsedMKController usedMKController;
	
	/**리스트*/
	@GetMapping("list")
	public void list(Model model, Criteria cri) {
		log.info("board.list");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("page", new PageDTO(service.getTotal(cri), cri));
	}
	/**등록get*/
	@PreAuthorize("isAuthenticated()")
	@GetMapping("register")
	public void register() {
	}
	/**등록Post*/
	@PreAuthorize("isAuthenticated()")
	@PostMapping("register")
	public String register(BoardVo boardVo, RedirectAttributes rttr) {
		log.info("register :: " + boardVo);
		service.register(boardVo);
		log.info("register :: " + boardVo);
		rttr.addFlashAttribute("result", boardVo.getBno());
//		rttr.addFlashAttribute("result", boardVo.getBno());
		return "redirect:/board/list";
	}
	/**수정Get*/
	@GetMapping({"get", "modify"})
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("get");
		model.addAttribute("board", service.get(bno));
	}
	/**수정Post*/
	@PreAuthorize("principal.username == #boardVo.writer")
	@PostMapping("modify")
	public String modify(BoardVo boardVo, RedirectAttributes rttr, Criteria cri) {
		log.info("modify :: " + boardVo);
		if(service.modify(boardVo)) {
			rttr.addFlashAttribute("result", "success");
		}
		/*rttr.addAttribute(cri.getParams());*/
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("category", cri.getCategory());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	/**글삭제*/
	@PreAuthorize("principal.username == #writer")
	@PostMapping("remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, Criteria cri, String writer) {
		log.info("remove :: " + bno);
		List<AttachVo> list = service.getAttachs(bno);
		if(service.remove(bno)) {
			list.forEach(vo-> {
				uploadController.deleteFile(vo.getFullPath(), vo.isImage());
				usedMKController.deleteLocation(bno);
			});
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("category", cri.getCategory());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	/**첨부파일Get*/
	@GetMapping("getAttachs/{bno}")
	public @ResponseBody List<AttachVo> getAttachs(@PathVariable Long bno) {
		return service.getAttachs(bno);
	}
	/**판매글정보Get*/
	@GetMapping("getUMKs/{bno}")
	public @ResponseBody List<UsedMKVO> getUMKs(@PathVariable Long bno) {
		return service.getUMKs(bno);
	}
}
