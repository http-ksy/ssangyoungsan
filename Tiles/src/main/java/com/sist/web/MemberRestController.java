package com.sist.web;

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
}
