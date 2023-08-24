package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.CleanDAO;
import com.sist.service.CleanService;
import com.sist.service.ReserveCleanService;
import com.sist.vo.CleanJjimVO;
import com.sist.vo.CleanVO;
import com.sist.vo.InteLikeVO;
import com.sist.vo.ReserveCleanVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CleanController {
	@Autowired
	private CleanService service;
	
	@Autowired
	private CleanDAO dao;
	@GetMapping("clean/list.do")
	public String clean_list() {
		return "clean/list";
	}
	@GetMapping("clean/detail.do")
	public String clean_detail(int cno,Model model,HttpSession session,HttpServletRequest request) {
		CleanJjimVO jvo=new CleanJjimVO();
		CleanVO vo=service.CleanDetailData(cno);
		String id=(String)session.getAttribute("id");
		if(id==null)
			id="";
		model.addAttribute("vo",vo);
		model.addAttribute("id", id);
		model.addAttribute("cno", cno);
		jvo.setCno(cno);
		jvo.setId(id);
		if(id!=null) {
			int jjim_count=service.cleanJjimOk(jvo);
			request.setAttribute("jjim_count",jjim_count);
			System.out.println(jjim_count);
		}
		return "clean/detail";
	}
	@GetMapping("clean/jjim_insert.do")
	public String jjim_insert(int cno, Model model, HttpServletRequest request) {
		//model.addAttribute("ino", ino);  //inte/inte_detail.do?ino=1&ino=1
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		//System.out.println("id: "+id);
		
		CleanJjimVO vo = new CleanJjimVO();
		vo.setId(id);
		vo.setCno(cno);
		service.cleanJjimInsert(vo);
		return "redirect:../clean/detail.do?cno="+cno;
		
	}
	@GetMapping("clean/jjim_delete.do")
	public String jjim_delete(int cno,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		CleanJjimVO vo = new CleanJjimVO();
		vo.setId(id);
		vo.setCno(cno);
		service.cleanJjimDelete(vo);
		return "redirect:../clean/detail.do?cno="+cno;
		
	}
}
