package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.service.InteService;
import com.sist.vo.*;

@RestController
public class InteRestController {

	@Autowired
	private InteDAO dao;
	@Autowired
	private InteService service;
	
	@PostMapping(value = "inte/list_vue.do", produces = "text/plain;charset=UTF-8")
	public String inte_list(int page,String column,String fd) throws Exception {
		if(fd==null || fd.equals("")) {
			fd="all";
		}
		Map map = new HashMap();
		map.put("column", column);
		map.put("fd", fd);
		
		int rowSize=12;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		map.put("start", start);
		map.put("end", end);
		
		List<InteVO> list = dao.inteListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "inte/inte_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String inte_page(int page,String column,String fd) throws Exception {
		 if(fd==null || fd.equals("")) {
			fd="all";
		 }
		 
		 Map map = new HashMap();
		 map.put("column", column);
		 map.put("fd", fd);
		 int totalpage = dao.inteTotalPage(map);
		 
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
	
	@GetMapping(value = "inte/inte_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String inte_detail(int ino) throws Exception {
		InteVO vo = dao.inteDetailData(ino);
	//	System.out.println(vo.getGubun());
		
		/*List<InteVO> list = dao.inteDetailData(no);
		for(InteVO vo : list) {
			String hashtag = vo.getHashtag();
			int start=hashtag.indexOf("#");
			int end=hashtag.indexOf("#", start+1);
			hashtag = hashtag.substring(start, end);
			vo.setHashtag(hashtag);
		}*/
		
		//System.out.println(vo.getHashtag());
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}

//댓글
	public String inteReply_list_data(int ino) {
		String json="";
		try {
			List<InteReplyVO> list = service.InteReplyListData(ino);
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(list);
		} catch(Exception e) {}
		return json;
	}

	@GetMapping(value = "inte/reply_read_vue.do",produces = "text/plain;charset=UTF-8")
	public String inteReply_read(int ino) {
		return inteReply_list_data(ino);
	}
	
	@PostMapping(value = "inte/reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String inteReply_insert(InteReplyVO vo, HttpSession session) {
		String id = (String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		vo.setId(id);
		vo.setName(name);
		//System.out.println("no"+vo.getNo());
		//System.out.println("ino"+vo.getIno());
		service.InteReplyInsert(vo);
		return inteReply_list_data(vo.getIno());
	}
	
	@GetMapping(value = "inte/reply_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public String inteReply_delete(int no,int ino) {
		dao.inteReplyDelete(no);
		return inteReply_list_data(ino);
	}
	
	@PostMapping(value = "inte/reply_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String inteReply_update(InteReplyVO vo) {
		dao.inteReplyUpdate(vo);  
		return inteReply_list_data(vo.getIno());
	}
	
	
// 예약
	@PostMapping(value = "inte/reserve_vue.do", produces = "text/plain;charset=UTF-8")
	public String inte_reserve(int ino, InteReserveVO vo, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		service.reserveOk(vo);		
		//System.out.println(vo.getRok());
		vo.setNo(Integer.parseInt(service.reserveNo(id)));
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
		
	}
	
}
