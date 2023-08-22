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
	
	public String reply_list_data(int no)
	{
		String json="";
		try
		{
			List<ProductReplyVO> list=dao.replyListData(no);
			ObjectMapper mapper=new ObjectMapper();
			json=mapper.writeValueAsString(list);
		}catch(Exception ex) {}
		return json;
	}
	
	@GetMapping(value = "product/reply_read_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_read(int no)
	{
		return reply_list_data(no);
	}
	@PostMapping(value = "product/reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_insert(ProductReplyVO vo,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		vo.setId(id);
		vo.setName(name);
		dao.replyInsert(vo);
		return reply_list_data(vo.getNo());
	}
	@GetMapping(value = "product/reply_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_delete(int prno,int no)
	{
		dao.replyDelete(prno);
		return reply_list_data(no);
	}
	@PostMapping(value = "product/reply_update_vue.do",produces = "text/plain;charset=UTF-8")
	public String reply_update(ProductReplyVO vo)
	{
		dao.replyUpdate(vo);
		return reply_list_data(vo.getNo());
	}
}
