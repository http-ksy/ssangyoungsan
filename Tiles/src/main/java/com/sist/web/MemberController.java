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
 @GetMapping("member/inte_reserve.do")
 public String member_inte_user_reserve()
 {
	 return "member/inte_reserve";
 }
 @GetMapping("member/admin_reserve.do")
 public String member_admin_reserve()
 {
	 return "member/admin_reserve";
 }
 @GetMapping("member/customer_buy.do")
 public String member_customer_buy()
 {
	return "member/customer_buy" ;
 }
 @GetMapping("member/admin_cart.do")
 public String member_admin_cart()
 {
	 return "member/admin_cart";
 }
 @GetMapping("member/user_cart.do")
 public String member_user_cart()
 {
	 return "member/user_cart";
 }
 @GetMapping("member/pwdfind.do")
 public String member_pwdfind()
 {
	 return "member/pwdfind";
 }
 @GetMapping("member/idfind.do")
 public String member_idfind()
 {
	 return "member/idfind";
 }
 @GetMapping("member/admin_purchase.do")
 public String member_admin_purchase()
 {
	 return "member/admin_purchase";
 }
 @GetMapping("member/user_purchase.do")
 public String member_user_purchase()
 {
	 return "member/user_purchase";
 }
}
