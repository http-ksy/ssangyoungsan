package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
@RestController
public class ProductReplyRestController {
	@Autowired
	private ProductReplyDAO dao;
	
	private String[] tables= {"","gagu_detail","fabric_detail","light_detail"};

	
	@GetMapping(value = "product/reply_read_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_read(int no,int type) throws Exception
	{
		String json="";
			Map map=new HashMap();
			map.put("no", no);
			map.put("type", type);
			List<ProductReplyVO> list=dao.replyListData(map);
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		
		return json;
	}
	@PostMapping(value = "product/reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_insert(ProductReplyVO vo,HttpSession session)
	{
		String result="";
		try
		{
			String id=(String)session.getAttribute("id");
			String name=(String)session.getAttribute("name");
			vo.setId(id);
			vo.setName(name);
			dao.replyInsert(vo);		
			result="yes";
			
		}catch(Exception ex) 
		{
			ex.printStackTrace();
			result="no";
		}
		
		return result;
	}
	@GetMapping(value = "product/reply_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_delete(int pno,int no)
	{
		String result="";
		try
		{
			dao.replyDelete(pno);
			result="yes";
			
		}catch(Exception ex) 
		{
			ex.printStackTrace();
			result="no";
		}
		
		return result;
	}
	@PostMapping(value = "product/reply_update_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_update(ProductReplyVO vo)
	{
		String result="";
		try
		{
			dao.replyUpdate(vo);
			result="yes";
			
		}catch(Exception ex) 
		{
			ex.printStackTrace();
			result="no";
		}
		
		return result;
	}
}
