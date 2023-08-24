package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.EstateQnaService;
import com.sist.service.MemberService;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.EstateQnaVO;
import com.sist.vo.MemberVO;
import com.sist.vo.PageVO;

@RestController
public class MemberRestController {
@Autowired
private BCryptPasswordEncoder encoder;

@Autowired
private MemberService service;

@Autowired 
private EstateQnaService qservice;
@PostMapping(value="member/join_ok.do",produces="text/plain;charset=UTF-8")
public String member_join(MemberVO vo)
{
	String result="";
	try
	{
		String en=encoder.encode(vo.getPwd());
		vo.setPwd(en);
		service.MemberInsert(vo);
		result="YES";
	}catch(Exception ex)
	{
		result="NO";
		ex.printStackTrace();
	}
	return result;			
 }
@GetMapping(value="member/id_check.do",produces="text/plain;charset=UTF-8")
 public String member_id_check(String id)
 {
	String result="";
	 try
	 {
		int count=service.memberIdCheck(id);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	 }catch(Exception ex)
	 {
		 
	 }
	return result;
 }
@GetMapping(value="member/nick_check.do",produces="text/plain;charset=UTF-8")
 public String member_nick_check(String nickname)
 {
	String result="";
	try
	{
		int count=service.memberNickCheck(nickname);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
 }
@GetMapping(value="member/email_check.do",produces="text/plain;charset=UTF-8")
public String member_email_check(String email)
{
	String result="";
	try
	{
		int count=service.memberEmailCheck(email);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
}
@GetMapping(value="member/phone_check.do",produces="text/plain;charset=UTF-8")
public String member_phone_check(String phone)
{
	String result="";
	try
	{
		int count=service.memberPhoneCheck(phone);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
}
@PostMapping(value="member/login_ok.do",produces="text/plain;charset=UTF-8")
public String member_login(String id, String pwd,boolean ck,HttpSession session,HttpServletResponse response)
{
	String result="";
	try
	{
		int count=service.memberIdCheck(id);
		if(count==0)
		{
			result="noid";
		}
		else //count=1 아이디 있음 => pwd 비교
		{
			MemberVO vo= service.memberLogin(id);
			if(encoder.matches(pwd, vo.getPwd())) // pwd 일치
			{
				session.setAttribute("name", vo.getName());
				session.setAttribute("sex", vo.getSex());
				session.setAttribute("id", vo.getId());
				session.setAttribute("admin", vo.getAdmin());
				session.setAttribute("nickname", vo.getNickname());
				session.setAttribute("pwd", vo.getPwd());
				result="yes";
				Cookie cookie=null;
				if(ck==true)
				{
					cookie=new Cookie("id", id);
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
					
					cookie=new Cookie("name", vo.getName());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
					
					
				}
				else
				{
					if(cookie!=null)
					{
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
			else // pwd다름
			{
				result="nopwd";
			}
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
}
@GetMapping(value="member/mypage_vue.do",produces="text/plain;charset=UTF-8")
public String memberInfo(String id) throws Exception
{
	
	MemberVO vo=service.memberInfo(id);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(vo);
	return json;
}
@PostMapping(value="member/pwd_ok.do",produces="text/plain;charset=UTF-8")
public String memberPwdCheck(String id,String pwd)
{
	String result="";
	String password=service.memberPwdCheck(id);
	if(encoder.matches(pwd, password))
	{
		result="yes";
	}
	else
	{
		result="no";
	}
	return result;
}
@PostMapping(value="member/update.do",produces="text/plain;charset=UTF-8")
public String memberUpdate(MemberVO vo)
{
	String result="";
	System.out.println(vo.getId());
	try
	{
		String en=encoder.encode(vo.getPwd());
		vo.setPwd(en);
		service.memberUpdate(vo);
		result="yes";
	}catch(Exception ex)
	{
		result="no";
		ex.printStackTrace();
	}
	return result;		
}
@PostMapping(value="member/delete_ok.do",produces="text/plain;charset=UTF-8")
public String memberDelete(String id,String pwd,HttpSession session)
{
	String result="";
	String password=service.memberPwdCheck(id);
	if(encoder.matches(pwd, password))
	{
		session.invalidate();
		result="yes";
		service.memberDelete(id);
	}
	else
	{
		result="no";
	}
	return result;
}
 @GetMapping(value="member/member_find.do",produces="text/plain;charset=UTF-8")
 public String member_find(int page,String col,String fd) throws Exception
 {
	 
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 int rowSize=10;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=rowSize*page;
	 map.put("start",start);
	 map.put("end", end);
	 List<MemberVO> mlist=service.memberFindData(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(mlist);
	 return json;
 }
 @GetMapping(value="member/member_page.do",produces="text/plain;charset=UTF-8")
 public String member_page(int page,String col,String fd) throws Exception
 {
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 int totalpage=service.memberTotalPage(map);
	 
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
 @PostMapping(value="member/member_ban.do",produces="text/plain;charset=UTF-8")
 public String member_ban(String id)
 {
	 
	 String result="";
	try
	{
		
	  service.memberDelete(id);
	  result="yes";
	}catch(Exception ex) {
	  result="no";	
	}
	return result;
	
 }
 @GetMapping(value="member/customer_zip.do",produces="text/plain;charset=UTF-8")
 public String customer_zip(int page,String col,String fd,String name) throws Exception
 {
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 map.put("name", name);
	 int rowSize=10;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start",start);
	 map.put("end", end);
	 List<EstateDetailVO> list=service.zipTypeData(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/customer_page.do",produces="text/plain;charset=UTF-8")
 public String customer_page(int page,String col,String fd,String name) throws Exception
 {
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 map.put("name", name);
	 int totalpage=service.zipBuyTotalPage(map);
	 
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
 @GetMapping(value="member/answer.do",produces="text/plain;charset=UTF-8")
 public String member_answer(int page, String company) throws Exception
 {
	 Map map=new HashMap();
	 map.put("company", company);
	 
	 int rowSize=5;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=rowSize*page;
	 map.put("start", start);
	 map.put("end", end);
	 
	 List<EstateQnaVO> list=qservice.estateQnaCompanyListData(map);
	 ObjectMapper mapper=new ObjectMapper();
	 
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/answer_page.do",produces="text/plain;charset=UTF-8")
 public String answer_page(int page,String company) throws Exception
 {
	 Map map=new HashMap();
	 
	 map.put("company", company);
	 int totalpage=qservice.customerTotalPage(map);
	 
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
 @PostMapping(value="member/answer_insert.do",produces="text/plain;charset=UTF-8")
 public String answer_insert(int no, String content) throws Exception
 {
	 Map map=new HashMap();
	 System.out.println("no:"+no);
	 System.out.println("content: "+content);
	 map.put("no", no);
	 map.put("content", content);
	 
	 String result=qservice.estateQnaUpdate(map); // 답변
	 return result;
	 
 }
}
