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
 @GetMapping("member/admin.do")
 public String member_admin()
 {
	 return "member/admin";
 }
 @GetMapping("member/customer.do")
 public String member_customer()
 {
	 return "member/customer";
 }
 @GetMapping("member/intecustomer.do")
 public String member_inte()
 {
	 return "member/intecustomer";
 }
 @GetMapping("member/intezim.do")
 public String member_intelike()
 {
	 return "member/intezim";
 }
 
 @GetMapping("member/movezim.do")
 public String member_movezime()
 {
	 return "member/movezim";
 }
 
 @GetMapping("member/cleanzim.do")
 public String member_cleanzime()
 {
	 return "member/cleanzim";
 }
 @GetMapping("member/customer_reserve.do")
 public String member_customer_reserve()
 {
	 return "member/customer_reserve";
 }
}
