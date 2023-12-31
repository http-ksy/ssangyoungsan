package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;

import oracle.jdbc.proxy.annotation.Post;

@RestController
public class ZipRestController {
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private ZipService service;
	@Autowired
	private CompanyReviewService reservice;
	@Autowired
	private EstateQnaService qservice;
	@GetMapping(value="zip/zip_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String zip_list(int etype,int page) throws Exception
	{
		System.out.println(etype);
		Map map=new HashMap();
			int curpage=page;
			int rowSize=16;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			map.put("etype", etype);
			int totalpage=service.EstateTotalPage(etype);
			int total=service.EstateTotalData();
			int BLOCK=5;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage)
				endPage=totalpage;
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
	public String page_data(int page, int etype) throws Exception
	{
		 int curpage=page;
		 int rowSize=16;
		 int start=(rowSize*curpage)-(rowSize-1);
		 int end=rowSize*curpage;
		 int totalpage=service.EstateTotalPage(etype);
		 int total=service.EstateTotalData();
		 int BLOCK=5;
		 int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		 PageVO vo=new PageVO();
		 if(endPage>totalpage)
				endPage=totalpage;
		 vo.setCurpage(curpage);
		 vo.setEndPage(endPage);
		 vo.setTotalpage(totalpage);
		 vo.setStartPage(startPage);
		 ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	@GetMapping(value="zip/zip_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String estate_detail(int no) throws Exception
	{
		EstateDetailVO vo=service.EstateDetailData(no);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "zip/zipsago_vue.do",produces = "text/plain;charset=UTF-8")
	public String zipsago(int no,String id)
	{
		String json="";
		Map map=new HashMap();
		map.put("no", no);
		map.put("id", id);
		try
		{
			service.zipbuyInsert(map, no);
			json="OK";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			json="NO";
		}
		
		return json;
	}
	
	@GetMapping(value = "zip/review_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String company_review(int no) throws Exception
	{
		List<CompanyReviewVO> list=reservice.companyReviewListData(no);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "member/zipbuy_vue.do",produces = "text/plain;charset=UTF-8")
	public String zipbuy_list(String id) throws Exception
	{
		List<EstateDetailVO> list=service.zipbuy(id);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "zip/review_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String company_review_insert(int no,String id,String content) throws Exception
	{
		String json="";
		CompanyReviewVO vo=new CompanyReviewVO();
		vo.setCno(no);
		vo.setId(id);
		vo.setContent(content);
		try
		{
			reservice.companyReviewInsert(vo);
			json="OK";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			json="NO";
		}
		
		return json;
	}
	@GetMapping(value="zip/reviewDelete_vue.do",produces = "text/plain;charset=UTF-8")
	public String companyReviewDelete(int rno,String id,String pwd) throws Exception
	{
		String json="";
		String dbpwd=reservice.companyReviewPwd(id);

			if(encoder.matches(pwd, dbpwd))
			{
				reservice.companyReviewDelete(rno);
				json="OK";
			}
			else
			{
				json="NO";
			}
		return json;
	}
	@GetMapping(value="zip/zipZim_vue.do",produces = "text/plain;charset=UTF-8")
	public String zipZim(int no,String id)
	{
		String json="";
		zipZimVO vo=new zipZimVO();
		vo.setNo(no);
		vo.setId(id);
		int check=service.zipZimCheck(vo);
		System.out.println(check);
		try
		{
			if(check==0)
			{
				json="OK";
				service.zipZim(vo);
			}
			else
			{
				json="NO";
				service.zipZimDelete(vo);
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return json;
	}
	@GetMapping(value = "member/zipZim_list.do",produces = "text/plain;charset=UTF-8")
	public String zipZim_list(int page,String id) throws Exception
	{
		Map map=new HashMap();
		map.put("id", id);
		int rowSize=8;
		int start=(rowSize*page)-(rowSize-1);
		int end=(rowSize*page);
		map.put("start", start);
		map.put("end", end);
		List<EstateDetailVO> list=service.zipZimList(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value="member/zim_page.do",produces="text/plain;charset=UTF-8")
	public String zim_page(int page, String id) throws Exception
	{
		 Map map=new HashMap();
		 map.put("id", id)
;		 int totalpage=service.zimTotalPage(map);
		 
		
		 
		 final int BLOCK=5;
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
	@GetMapping(value="member/zimZim_delete.do",produces = "text/plain;charset=UTF-8")
	public String zipZim_list_delete(String id,int no)
	{
		zipZimVO vo=new zipZimVO();
		vo.setId(id);
		vo.setNo(no);
		String result="";
		try
		{
			service.zipZimDelete(vo);
			result="yes";
		}catch(Exception ex)
		{
			ex.printStackTrace();
			result="no";
		}
		return result;
	}
	@GetMapping(value = "zip/zipQna_vue.do",produces = "text/plain;charset=UTF-8")
	public String zipQna(String id,int cno, String company,String question) throws Exception
	{
		Map map=new HashMap();
		map.put("id", id);
		map.put("cno", cno);
		map.put("question", question);
		map.put("company", company);
		String result=qservice.estateQnaInsert(map);
		return result;
	}
	@GetMapping(value = "zip/zip_find_vue.do",produces = "text/plain;charset=UTF-8")
	public String zipFind(String fd,int etype, int page) throws Exception
	{
		System.out.println(etype);
		Map map=new HashMap();
			int curpage=page;
			int rowSize=16;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			map.put("etype", etype);
			map.put("fd1", fd);
			map.put("fd2", fd);
			map.put("fd3", fd);
			map.put("fd4", fd);
			int totalpage=service.EstateTotalPage(etype);
			int total=service.EstateTotalData();
			int BLOCK=5;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage)
				endPage=totalpage;
			List<EstateDetailVO> list=service.estateFindData(map);
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
	@GetMapping(value="zip/zip_find_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_data(int page, int etype , String fd) throws Exception
	{
		 Map map=new HashMap();
		 map.put("etype", etype);
		 map.put("fd1", fd);
	 	 map.put("fd2", fd);
		 map.put("fd3", fd);
		 map.put("fd4", fd);
		 int curpage=page;
		 int rowSize=16;
		 int start=(rowSize*curpage)-(rowSize-1);
		 int end=rowSize*curpage;
		 int totalpage=service.estateFindPage(map);
		 int total=service.EstateTotalData();
		 int BLOCK=5;
		 int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		 int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		 PageVO vo=new PageVO();
		 if(endPage>totalpage)
				endPage=totalpage;
		 vo.setCurpage(curpage);
		 vo.setEndPage(endPage);
		 vo.setTotalpage(totalpage);
		 vo.setStartPage(startPage);
		 ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
}
