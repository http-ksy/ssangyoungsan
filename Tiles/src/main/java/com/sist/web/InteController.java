package com.sist.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.InteDAO;
import com.sist.vo.InteLikeVO;
import com.sist.vo.InteVO;

@Controller
public class InteController {
	
	@Autowired
	private InteDAO dao;
	
	@GetMapping("inte/inte_list.do")
	public String inte_list(Model model, HttpServletRequest request) {
		
		Cookie[] cookies = request.getCookies();
		List<InteVO> iList = new ArrayList<InteVO>();
		if(cookies != null) {
			for(int i=cookies.length-1; i>=0; i--) {
				if(cookies[i].getName().startsWith("inte_")) {
					String ino = cookies[i].getValue();
					InteVO vo = dao.inteDetailData(Integer.parseInt(ino));
					iList.add(vo);
				}
			}		
		}
		model.addAttribute("iList", iList);
		return "inte/inte_list";
	}
	//쿠키
	@GetMapping("inte/inte_before_detail.do")
	public String inte_before_detail(int ino, RedirectAttributes ra, HttpServletResponse response) {
		Cookie cookie = new Cookie("inte_"+ino, String.valueOf(ino));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
			
		response.addCookie(cookie);
		ra.addAttribute("ino", ino);
		return "redirect:../inte/inte_detail.do";
	
	}
	@GetMapping("inte/inte_detail.do")
	public String inte_detail(int ino, Model model,HttpServletRequest request) {
		model.addAttribute("ino", ino);
		
		InteLikeVO vo = new InteLikeVO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		vo.setIno(ino);
		//System.out.println(vo.getIno());
		vo.setId(id);
		if(id != null) {
			int like_count = dao.inteLikeOk(vo);
			request.setAttribute("like_count",like_count);	
		//	System.out.println("like_count: "+like_count);
			//System.out.println("id"+id);
		}
		InteVO vo2 = dao.inteDetailData(ino);
		model.addAttribute("vo2", vo2);
		model.addAttribute("ino", ino);
		
		
		return "inte/inte_detail";
	}
	
	@GetMapping("inte/like_insert.do")
	public String like_insert(int ino, Model model, HttpServletRequest request) {
		//model.addAttribute("ino", ino);  //inte/inte_detail.do?ino=1&ino=1
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		//System.out.println("id: "+id);
		
		InteLikeVO vo = new InteLikeVO();
		vo.setId(id);
		vo.setIno(ino);
		dao.inteLikeInsert(vo);
		return "redirect:../inte/inte_detail.do?ino="+ino;
		
	}
	@GetMapping("inte/like_delete.do")
	public String like_delete(int ino,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		InteLikeVO vo = new InteLikeVO();
		vo.setId(id);
		vo.setIno(ino);
		dao.inteLikeDelete(vo);
		return "redirect:../inte/inte_detail.do?ino="+ino;
		
	}

}
