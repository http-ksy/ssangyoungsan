package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.*;
@Controller
public class ZipController {
	@Autowired
	private ZipService service;
	@GetMapping("zip/zip_list.do")
	public String zip_list(Model model,HttpServletRequest request)
	{
		int total=service.EstateTotalData();
		model.addAttribute("total",total);
		
		Cookie[] cookies=request.getCookies();
		 List<EstateDetailVO> clist=new ArrayList<>();
		 if(cookies!=null)
		 {
			 for(int i=cookies.length-1;i>=0;i--)
			 {
				 if(cookies[i].getName().startsWith("zip"))
				 {
					 String no=cookies[i].getValue();
					 EstateDetailVO cvo=service.EstateDetailData(Integer.parseInt(no));
					 String img=cvo.getImg();
					 img=img.substring(0,img.indexOf("^"));
					 cvo.setImg(img);
					 System.out.println("length"+cookies.length);
					 System.out.println("img:"+i+":"+cvo.getImg());
					 clist.add(cvo);
				 }
			 }
		 }
		 request.setAttribute("clist", clist);
		
		return "zip/zip_list";
	}
	@GetMapping("zip/zip_detail_before.do")
	public String zip_detail_before(int no,RedirectAttributes ra,HttpServletResponse response)
	  {
		  Cookie cookie=new Cookie("zip_"+no, String.valueOf(no));
		  // 쿠키 => 클라이언트 (단점:보안 취약, 문자열만 저장이 가능)
		  // 내장 객체는 아니다 
		  // 쿠키 생성 => 저장 장소 설정 => 기간 설정 => 전송 
		  cookie.setPath("/");
		  cookie.setMaxAge(60*60*24); // 초단위로 저장 
		  response.addCookie(cookie);
	 	 ra.addAttribute("no", no);// sendRedirect => request를 초기화 
	 	 return "redirect:../zip/zip_detail.do";
	  }
	@GetMapping("zip/zip_detail.do")
	public String zip_detail(int no,Model model)
	{
		EstateDetailVO vo=service.EstateDetailData(no);
		String addr=vo.getAddr();
		model.addAttribute("addr",addr);
		model.addAttribute("no",no);
		return "zip/zip_detail";
	} // list.jsp >>>> detail_before.do >>>>> detail.do >>>> detail.jsp
	
	@GetMapping("zip/zipsago.do")
	public String zip_sago(int no,Model model)
	{
		model.addAttribute("no",no);
		return "zip/zipsago";
	}
	@GetMapping("member/zipbuy.do")
	public String zip_buy(Model model)
	{
		
		return "member/zipbuy";
	}
	@GetMapping("member/zipzim.do")
	public String zip_zim(Model model)
	{
		return "member/zipzim";
	}
	@GetMapping("member/qna.do")
	public String zip_answer(Model model)
	{
		return "member/qna";
	}
	@GetMapping("member/zipqna.do")
	public String zip_question(Model model)
	{
		return "member/zipqna";
	}
}
