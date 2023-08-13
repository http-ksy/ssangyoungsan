package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@RestController
public class MemberRestController {
@Autowired
private BCryptPasswordEncoder encoder;
@Autowired
private MemberDAO dao;
@PostMapping(value="member/join_ok.do",produces="text/plain;charset=UTF-8")
public String member_join(MemberVO vo)
{
	String result="";
	try
	{
		String en=encoder.encode(vo.getPwd());
		vo.setPwd(en);
		dao.MemberInsert(vo);
		result="YES";
	}catch(Exception ex)
	{
		result="NO";
		ex.printStackTrace();
	}
	return result;			
}
}
