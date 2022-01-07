package site.awsomekingmoon.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import site.awsomekingmoon.domain.UsedMKDTO;
import site.awsomekingmoon.mapper.UsedMKMapper;
/**
 * @author 이창연
 * 판매글 정보 컨트롤러 
 */
@Controller @Log4j
public class UsedMKController {
	@Setter @Autowired
	private UsedMKMapper usedMKMapper;
	
	@PostMapping("uploadUMK")
	public @ResponseBody List<UsedMKDTO> upload(UsedMKDTO mkdto) {
		List<UsedMKDTO> list = new ArrayList<>();
		UsedMKDTO dto = new UsedMKDTO(mkdto.getLongitude(), mkdto.getLatitude());
		log.info(dto);
		list.add(dto);
		return list;
	}
	
	@PostMapping("deleteLocation")
	public @ResponseBody void deleteLocation(Long bno) {
		usedMKMapper.delete(bno);
	}
	
}
