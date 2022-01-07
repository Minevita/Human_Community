package site.awsomekingmoon.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.ReplyCriteria;
import site.awsomekingmoon.domain.ReplyVO;
import site.awsomekingmoon.service.ReplyService;



/**
 * @author 성지혜
 *	댓글 Controller 
 */
@RestController
@AllArgsConstructor
@Log4j
@RequestMapping("/replies")
public class ReplyController {
	private ReplyService service;
	
	/* 등록 */
	@PostMapping("new")
	public String create(@RequestBody ReplyVO vo) {
		log.info("create :: " + vo);
		service.register(vo);
		log.info(vo);
		return "success";
	}
	
	@GetMapping("{rno}")
	public ReplyVO get(@PathVariable Long rno) {
		log.info("get..:: " + rno);
		return service.get(rno);
	}

	/* 수정 */
	@PutMapping("{rno}")
	public String modify(@PathVariable long rno, @RequestBody ReplyVO vo) {
		log.info("modify :: " + vo);
		service.modify(vo);
		return "success";
	}

	/* 삭제 */
	@DeleteMapping("{rno}")
	public String remove(@PathVariable Long rno) {
		log.info("remove :: " + rno);
		service.remove(rno);
		return "success";
	}

	@GetMapping("{bno}/{amount}/{lastRno}")
	public List<ReplyVO> getList(@PathVariable Long bno, @PathVariable(required = false) Optional<Long> lastRno,
			@PathVariable(required = false) Integer amount) {
		return service.getList(new ReplyCriteria(lastRno.get(), amount), bno);
	}
}
