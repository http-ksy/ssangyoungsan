package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;

@RestController
public class ZipRestController {
	@Autowired
	private ZipService service;
	
	@GetMapping(value="zip/zip_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String zip_list(int etype) throws Exception
	{
		String page=null;

		System.out.println(etype);
		Map map=new HashMap();
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=16;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			map.put("etype", etype);
			int totalpage=service.EstateTotalPage(etype);
			int total=service.EstateTotalData(etype);
			int BLOCK=5;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			List<EstateDetailVO> list=service.EstateListData(map);
			for(EstateDetailVO vo:list)
			{
				
				String img=vo.getImg();
				img=img.substring(0,img.indexOf("^"));
				vo.setImg(img);
			}
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value="zip/zip_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_data(String page, int etype) throws Exception
	{
		if(page==null)
			 page="1";
		 int curpage=Integer.parseInt(page);
		 int rowSize=16;
		 int start=(rowSize*curpage)-(rowSize-1);
		 int end=rowSize*curpage;
		 int totalpage=service.EstateTotalPage(etype);
		 int total=service.EstateTotalData(etype);
		 int BLOCK=5;
		 int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		 PageVO vo=new PageVO();
		 vo.setCurpage(curpage);
		 vo.setEndPage(endPage);
		 vo.setTotalpage(totalpage);
		 vo.setStartPage(startPage);
		 ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			return json;
	}
	@GetMapping(value="zip/zip_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String apt_detail(int no) throws Exception
	{
		EstateDetailVO vo=service.EstateDetailData(no);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
}
