package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
 private BCryptPasswordEncoder encoder; // 암호화 복호화

 @GetMapping("member/join.do")
 public String member_join()
 {
	 return "member/join";
 }
 @GetMapping("member/logout.do")
 public String member_logout(HttpSession session)
 {
	 session.invalidate();
	 return "redirect:../main/main.do";
 }
 
 @GetMapping("member/mypage.do")
 public String member_mypage()
 {
	 return "member/mypage";
 }

}
