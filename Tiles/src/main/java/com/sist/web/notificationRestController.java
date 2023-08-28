package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;
@RestController


public class notificationRestController {
	@Autowired
	private notificationService service;
	
	@GetMapping(value = "noticeboard/landnotice_list.do",produces = "text/plain;charset=utf-8")
	public String landnotice_list(int page)throws Exception{
		Map map = new HashMap();
		int rowSize=10;
		int start = (rowSize*page)-(rowSize-1);
		int end = (rowSize*page);
		map.put("start", start);
		map.put("end", end);
		List<notificationVO> list = service.noticeList(map);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@PostMapping(value = "noticeboard/boardnotice_insert.do",produces = "text/plain;charset=utf-8")
	public void landnotice_insert(notificationVO vo) {
		System.out.println(vo.getId());
		vo.setName("관리자");
		service.landnoticeInsert(vo);
	}
	@GetMapping(value = "noticeboard/boardnotice_page.do",produces = "text/plain;charset=utf-8")
	public String landnotice_page(int page)throws Exception {
		String json ="";
		PageVO vo = service.landnotice_page(page);
		ObjectMapper mapper = new ObjectMapper();
		json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value = "noticeboard/boardnotice_delete.do",produces = "text/plain;charset=utf-8")
	public void landnotice_delete(int no) {
		service.landnoticeDelete(no);
	}
	
	@GetMapping(value = "noticeboard/boardnotice_detail.do",produces = "text/plain;charset=utf-8")
	public String llandnotice_detail(int no)throws Exception {
		return new ObjectMapper().writeValueAsString(service.landnoticeDetail(no));
	}
	
	@PostMapping(value = "noticeboard/boardnotice_update.do",produces = "text/plain;charset=utf-8")
	public void landnotice_update(notificationVO vo) {
		service.landnoticeUpdate(vo);
	}
}
