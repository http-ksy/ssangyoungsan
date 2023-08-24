package com.sist.web;

import java.util.*;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.service.CleanService;
import com.sist.service.ReserveCleanService;
import com.sist.vo.CleanVO;
import com.sist.vo.ReserveCleanVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.ReserveCleanDAO;
@Controller
public class ReserveCleanController {
	@Autowired
	private ReserveCleanDAO dao;

	@RequestMapping("clean/diary.do")
	public String diaryData(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String strYear=request.getParameter("year");
		String strMonth=request.getParameter("month");

		Date date = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		String today=sdf.format(date);
		StringTokenizer st=new StringTokenizer(today,"-");
		String sy=st.nextToken();
		String sm=st.nextToken();
		String sd=st.nextToken();

		if(strYear==null)
			strYear=sy;

		if(strMonth==null)
			strMonth=sm;

		int year=Integer.parseInt(strYear);
		int month=Integer.parseInt(strMonth);
		int day=Integer.parseInt(sd);

		//요일
		String[] strWeek={"일","월","화","수","목","금","토"};

		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR,year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE,1); //1 일차

		int week=cal.get(Calendar.DAY_OF_WEEK); // 요일 구하기
		int lastday=cal.getActualMaximum(Calendar.DATE); // 각달의 마지막 일

		week=week-1;

		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		request.setAttribute("strWeek", strWeek);

		// 오라클 데이터 읽기
		int[] rday=new int[32];
		String r=dao.cleanReserveDay(Integer.parseInt(cno));
		st=new StringTokenizer(r,",");
		while(st.hasMoreTokens()) {
			int a=Integer.parseInt(st.nextToken());
			if(a>=day) {
				rday[a]=1; //1은 예약가능 날짜 0은 불가능한 날짜
			}
		}
		request.setAttribute("rday", rday);
		return "clean/diary";
	}
	@RequestMapping("clean/reserve_.do")
	public String reserve_main(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("main_jsp", "../clean/reserve_main.jsp");
		return "main/main";
	}
	@RequestMapping("clean/inwon.do")
	public String reserve_inwon(HttpServletRequest request, HttpServletResponse response) {

		return "clean/inwon";
	}
	@RequestMapping("clean/time.do")
	public String reserve_time(HttpServletRequest request, HttpServletResponse response) {
		String day=request.getParameter("day");

		String times=dao.reserve_day_time(Integer.parseInt(day));
		StringTokenizer st=new StringTokenizer(times,",");
		List<String> list=new ArrayList<String>();
		while(st.hasMoreTokens()) {
			String time=dao.reserve_get_time(Integer.parseInt(st.nextToken()));
			list.add(time);
		}

		request.setAttribute("list", list);
		return "clean/time";
	}
	@RequestMapping("clean/reserve_ok.do")
	public String reserve_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String cno=request.getParameter("cno");
		String rday=request.getParameter("rday");
		String rtime=request.getParameter("rtime");
		String inwon=request.getParameter("inwon");

		//DAO 연결
		System.out.println("cno="+cno);
		System.out.println("rday="+rday);
		System.out.println("rtime="+rtime);
		System.out.println("inwon="+inwon);

		HttpSession session=request.getSession();
		String rcid=(String)session.getAttribute("id");

		System.out.println("rcid="+rcid);

		ReserveCleanVO vo=new ReserveCleanVO();
		vo.setCno(Integer.parseInt(cno));
		vo.setRcid(rcid);
		vo.setRday(rday);
		vo.setRtime(rtime);
		vo.setRinwon(inwon);


		dao.reserve_ok(vo);
		return "redirect:../my/mypage_reserve.do";
	}
}
