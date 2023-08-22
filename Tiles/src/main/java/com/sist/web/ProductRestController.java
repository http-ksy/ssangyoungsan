package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
@RestController
public class ProductRestController {
	@Autowired
	private ProductDAO dao;
	
	
	private String[] tables= {"","gagu_detail","fabric_detail","light_detail"};
	
	@GetMapping(value = "product/product_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_list(int page,int type) throws Exception
	{
		Map map=new HashMap();
		int rowSize=21;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("table_name", tables[type]);
		List<ProductVO> list=dao.productListData(map);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "product/product_page_info_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_page_info(int page, int type) throws Exception
	{
		Map map=new HashMap();
		map.put("table_name", tables[type]);
		int totalpage=dao.productTotalPage(map);
		PageVO vo=new PageVO();
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "product/product_find_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_find_vue(int page,int type,String fd) throws Exception
	{
		if(fd==null || fd.equals(""))
		{
			fd="";
		}

		   Map map=new HashMap();
		   int rowSize=21;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   map.put("start", start);
		   map.put("end", end);
		   map.put("fd", fd);
		   map.put("table_name", tables[type]);
		   // DAO
		   List<ProductVO> list=dao.productFindData(map);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	}
	
	@GetMapping(value="product/page_info_vue.do",produces = "text/plain;charset=UTF-8")
	   public String page_info(int page,int type,String title,String fd)
	   throws Exception
	   {
		   if(fd==null || fd.equals(""))
		   {
			   fd="";
		   }
		   Map map=new HashMap();
		   map.put("table_name", tables[type]);
		   map.put("fd", fd);
		   
		   int count=dao.productFindCount(map);
		   System.out.println("count="+count);
		   System.out.println("fd="+fd);
		   int totalpage=(int)(Math.ceil(count/20.0));
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
		      endPage=totalpage;
		   
		   PageVO vo=new PageVO();
		   vo.setTotalpage(totalpage);
		   vo.setCurpage(page);
		   vo.setStartPage(startPage);
		   vo.setEndPage(endPage);
		   vo.setCount(String.valueOf(count));
		   
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
	
	@GetMapping(value = "product/product_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_detail(int no,int type) throws Exception
	{
		Map map=new HashMap();
		map.put("table_name", tables[type]);
		map.put("no", no);
		ProductVO vo=dao.productDetailData(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
}