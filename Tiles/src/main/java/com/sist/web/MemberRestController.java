package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

@RestController
public class MemberRestController {
@Autowired
private BCryptPasswordEncoder encoder;

@Autowired
private MemberService service;

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
}
