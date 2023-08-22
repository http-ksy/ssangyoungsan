package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.landboardService;
import com.sist.vo.landboardVO;


@RestController
public class landboardRestController {	
	@Autowired
	private landboardService service;
	
	@PostMapping(value = "landboard/landboard_insert.do",produces = "text/plain;charset=utf-8")
	public String landboardInsert(landboardVO vo,HttpSession session) {
		String result = "";
		try {
			String id = (String)session.getAttribute("id");	
			System.out.println("id" + id);
			vo.setId(id);
			System.out.println();
			service.landboardInsert(vo);
			result = "yes";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = "no";
		}
		return result;
	}
	@GetMapping(value = "landboard/landboard_list.do", produces = "text/plain;charset=utf-8")
	public String landboardList(int bno) throws Exception {
		
		Map map = new HashMap();
		map.put("bno",bno);
		List<landboardVO> list = service.landboard_list(map);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
	}
	@GetMapping(value="landboard/landboard_detail.do", produces = "text/plain;charset=utf-8")
	public String landboardDetail(int no) throws Exception{
		String json="";
		landboardVO vo= service.landboard_detail(no);
		ObjectMapper mapper=new ObjectMapper();
		json=mapper.writeValueAsString(vo);
		return json;
	}

}
