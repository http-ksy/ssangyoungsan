package com.sist.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.MoveService;
import com.sist.vo.CleanJjimVO;
import com.sist.vo.MoveJjimVO;
import com.sist.vo.MoveVO;

@Controller
public class MoveController {
	@Autowired
	private MoveService service;
	
	@GetMapping("move/list.do")
	public String move_list() {
		return "move/list";
	}
	@GetMapping("move/detail.do")
	public String move_detail(int mno,Model model,HttpSession session,HttpServletRequest request) {
		MoveJjimVO mvo=new MoveJjimVO();
		MoveVO vo=service.MoveDetailData(mno);
		String id=(String)session.getAttribute("id");
		if(id==null)
			id="";
		model.addAttribute("vo",vo);
		model.addAttribute("id", id);
		model.addAttribute("mno", mno);
		mvo.setMno(mno);
		mvo.setId(id);
		if(id!=null) {
			int jjim_count=service.moveJjimOk(mvo);
			request.setAttribute("jjim_count",jjim_count);
		}
		return "move/detail";
	}
	@GetMapping("move/jjim_insert.do")
	public String jjim_insert(int mno, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MoveJjimVO vo = new MoveJjimVO();
		vo.setId(id);
		vo.setMno(mno);
		service.moveJjimInsert(vo);
		return "redirect:../move/detail.do?mno="+mno;
		
	}
	@GetMapping("move/jjim_delete.do")
	public String jjim_delete(int mno,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MoveJjimVO vo = new MoveJjimVO();
		vo.setId(id);
		vo.setMno(mno);
		service.moveJjimDelete(vo);
		return "redirect:../move/detail.do?mno="+mno;
		
	}
}
