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
	public String zip_list(int num) throws Exception
	{
		String page=null;

		System.out.println(num);
		Map map=new HashMap();
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=16;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			int totalpage=service.aptTotalPage();
			int total=service.apttotaldata();
			int BLOCK=5;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			List list=new ArrayList();
		if(num==1)
		{
			List<AptVO> alist=service.aptListData(map);
			for(AptVO vo:alist)
			{
				
				String img=vo.getImg();
				img=img.substring(0,img.indexOf("^"));
				vo.setImg(img);
			}
			list=alist;
		}
		else if(num==2)
		{
			List<OpVO> olist=service.opListData(map);
			for(OpVO vo:olist)
			{
				
				String img=vo.getImg();
				img=img.substring(0,img.indexOf("^"));
				vo.setImg(img);
			}
			list=olist;
		}
		else if(num==3)
		{
			List<BunVO> blist=service.bunListData(map);
			for(BunVO vo:blist)
			{
				
				String img=vo.getImg();
				img=img.substring(0,img.indexOf("^"));
				vo.setImg(img);
			}
			list=blist;
		}
		else if(num==4)
		{
			List<HouseVO> hlist=service.houseListData(map);
			for(HouseVO vo:hlist)
			{
				
				String img=vo.getImg();
				img=img.substring(0,img.indexOf("^"));
				vo.setImg(img);
			}
			list=hlist;
		}
		else if(num==5)
		{
			List<RoomVO> rlist=service.roomListData(map);
			for(RoomVO vo:rlist)
			{
				
				String img=vo.getImg();
				img=img.substring(0,img.indexOf("^"));
				vo.setImg(img);
			}
			list=rlist;
		}

		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value="zip/zip_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_data(String page) throws Exception
	{
		if(page==null)
			 page="1";
		 int curpage=Integer.parseInt(page);
		 int rowSize=16;
		 int start=(rowSize*curpage)-(rowSize-1);
		 int end=rowSize*curpage;
		 int totalpage=service.aptTotalPage();
		 int total=service.apttotaldata();
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
		AptVO vo=service.aptDetailData(no);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
}
