package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.service.InteService;
import com.sist.vo.*;

@RestController
public class InteRestController {

	@Autowired
	private InteService service;
	
	@GetMapping(value = "inte/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String inte_list(int page) throws Exception {
		Map map = new HashMap();
		int rowSize=12;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		map.put("start", start);
		map.put("end", end);
		
		List<InteVO> list = service.inteListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "inte/inte_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String inte_page(int page) throws Exception {
		 int totalpage = service.inteTotalPage();
		 
		 final int BLOCK=5;
		 int startPage=((page-1)/BLOCK*BLOCK)+1;
		 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		 
		 PageVO vo = new PageVO();
		 vo.setTotalpage(totalpage);
		 vo.setCurpage(page);
		 vo.setStartPage(startPage);
		 vo.setEndPage(endPage);
		 
		 ObjectMapper mapper = new ObjectMapper();
		 String json = mapper.writeValueAsString(vo);
		 return json;
	}
		
}
