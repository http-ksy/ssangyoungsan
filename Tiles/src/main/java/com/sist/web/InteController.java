package com.sist.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.InteDAO;
import com.sist.vo.InteLikeVO;
import com.sist.vo.InteVO;

@Controller
public class InteController {
	
	@Autowired
	private InteDAO dao;
	
	@GetMapping("inte/inte_list.do")
	public String inte_list(Model model) {
		return "inte/inte_list";
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
	
	//예약
		@RequestMapping("inte/diary.do")
		public String diaryDate(HttpServletRequest request, HttpServletResponse response) {
			String ino = request.getParameter("ino");
			String strYear = request.getParameter("year");
			String strMonth = request.getParameter("month");
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
			String today = sdf.format(date);
			StringTokenizer st = new StringTokenizer(today,"-");
			String sy = st.nextToken();
			String sm = st.nextToken();
			String sd = st.nextToken();
			
			if(strYear==null)
				strYear=sy;
			
			if(strMonth==null)
				strMonth=sm;
			
			int year = Integer.parseInt(strYear);
			int month = Integer.parseInt(strMonth);
			int day = Integer.parseInt(sd);
			
			String[] strWeek = {"일","월","화","수","목","금","토"};
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month-1);
			cal.set(Calendar.DATE, 1);
			
			int week = cal.get(Calendar.DAY_OF_WEEK);
			int lastday = cal.getActualMaximum(Calendar.DATE);
			week = week-1;
			
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("day", day);
			request.setAttribute("week", week);
			request.setAttribute("lastday", lastday);
			request.setAttribute("strWeek", strWeek);
		
			// 오라클 데이터 읽기
			int[] rday=new int[32];
			//ReserveDAO dao=ReserveDAO.newInstance();
			
			String r=dao.InteReserveDay(Integer.parseInt(ino));
			st=new StringTokenizer(r,",");
			while(st.hasMoreTokens()) {
				int a=Integer.parseInt(st.nextToken());
				if(a>=day) {
					rday[a]=1; //1은 예약가능 날짜 0은 불가능한 날짜
				}
			}
			request.setAttribute("rday", rday);

			return "inte/diary";
		}
}
