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

@RestController
public class CleanRestController {
	@Autowired
	private CleanService service;
	
	@GetMapping(value = "clean/list_vue.do",produces = "text/plain;charset=UTF-8")
	public String clean_list(Integer cno, String page) throws Exception {
		String result="";
		try {
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			Map map=new HashMap();
			map.put("start", (curpage*12)-11);
			map.put("end", curpage*12);
			List<CleanVO> list=service.CleanListData(map);
			int totalpage=service.CleanTotalPage();
			
			// 블록별 처리
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage)
				endPage=totalpage;
			//JSON으로 변경
			int i=0;
			JSONArray arr=new JSONArray();
			for(CleanVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("cno", vo.getCno());
				obj.put("title", vo.getTitle());
				obj.put("poster", vo.getPoster());
				obj.put("score", vo.getScore());
				
				if(i==0) { //JSONArray => 0번째
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("startPage", startPage);
					obj.put("endPage", endPage);
				}
				arr.add(obj);
				i++;
			}
			result=arr.toJSONString();
		} catch (Exception e) {e.printStackTrace();}
		return result;
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
