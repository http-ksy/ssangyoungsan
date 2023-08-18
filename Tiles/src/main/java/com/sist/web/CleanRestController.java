package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.CleanService;
import com.sist.vo.CleanVO;
import com.sist.vo.PageVO;

@RestController
public class CleanRestController {
	@Autowired
	private CleanService service;
	
	@GetMapping(value = "clean/list_vue.do",produces = "text/plain;charset=UTF-8")
	public String clean_list(Integer cno, String page,String column,String fd) throws Exception {
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			Map map=new HashMap();
			map.put("column", column);	
			map.put("fd", fd);
			int rowSize=12;
			int start=(curpage-1)*rowSize+1;
			int end=curpage*rowSize;
			map.put("start", start);
			map.put("end", end);
			List<CleanVO> list=service.cleanFindData(map);
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(list);
			int totalpage=service.CleanTotalPage();
			
			// 블록별 처리
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage)
				endPage=totalpage;
			
		return json;
	}
	
//	@GetMapping(value = "clean/list_find_vue.do",produces = "text/plain;charset=UTF-8")
//	public String clean__list_find(int page, String column,String fd) throws Exception {
////			if(page==null)
////				page="1";
////			int curpage=Integer.parseInt(page);
//			Map map=new HashMap();
//			map.put("column", column);
//			map.put("fd", fd);
//			int rowSize=12;
//			int start=(page-1)*rowSize+1;
//			int end=page*rowSize;
//			map.put("start", start);
//			map.put("end", end);
//			List<CleanVO> list=service.CleanListData(map);
//			ObjectMapper mapper=new ObjectMapper();
//			String json=mapper.writeValueAsString(list);
////			int totalpage=service.CleanTotalPage();
//			
//			// 블록별 처리
////			final int BLOCK=10;
////			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
////			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
////			if(endPage>totalpage)
////				endPage=totalpage;
//			
//		return json;
//	}
	
	@GetMapping(value = "clean/page_vue.do",produces = "text/plain;charset=UTF-8")
	public String clean_page(int page,String column,String fd) throws Exception{
		Map map=new HashMap();
		map.put("column", column);
		map.put("fd", fd);
		int totalpage=service.cleanFindTotalPage(map);
		
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "clean/detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String clean_detail(int cno,HttpSession session) throws Exception{
		String result="";
		CleanVO vo=service.CleanDetailData(cno);
		ObjectMapper mapper=new ObjectMapper();
		result=mapper.writeValueAsString(vo);
		return result;
	}
}
