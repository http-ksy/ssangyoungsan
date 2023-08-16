package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MoveService;
import com.sist.vo.CleanVO;
import com.sist.vo.MoveVO;

@RestController
public class MoveRestController {
	@Autowired
	private MoveService service;
	
	@GetMapping(value = "move/list_vue.do",produces = "text/plain;charset=UTF-8")
	public String move_list(Integer mno,String page) throws Exception {
		String result="";
		try {
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			Map map=new HashMap();
			map.put("start", (curpage*12)-11);
			map.put("end", curpage*12);
			List<MoveVO> list=service.MoveListData(map);
			int totalpage=service.MoveTotalPage();
			
			// 블록별 처리
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage)
				endPage=totalpage;
			//JSON으로 변경
			int i=0;
			JSONArray arr=new JSONArray();
			for(MoveVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("mno", vo.getMno());
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
	@GetMapping(value = "move/detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String move_detail(int mno,HttpSession session) throws Exception{
		String result="";
		MoveVO vo=service.MoveDetailData(mno);
		ObjectMapper mapper=new ObjectMapper();
		result=mapper.writeValueAsString(vo);
		return result;
	}
}
