package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


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
@PostMapping(value="member/login_ok.do",produces="text/plain;charset=UTF-8")
public String member_login(String id, String pwd,HttpSession session)
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
				result="yes";
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
}
