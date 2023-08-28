package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.EstateQnaService;
import com.sist.service.MemberService;
import com.sist.vo.CleanJjimVO;
import com.sist.vo.CleanVO;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.EstateQnaVO;
import com.sist.vo.InteLikeVO;
import com.sist.vo.InteReserveVO;
import com.sist.vo.InteVO;
import com.sist.vo.MemberVO;
import com.sist.vo.MoveJjimVO;
import com.sist.vo.MoveVO;
import com.sist.vo.PageVO;
import com.sist.vo.ProductCartVO;
import com.sist.vo.ProductOrderVO;
import com.sist.vo.ReserveCleanVO;
import com.sist.vo.ReserveMoveVO;
import com.sist.vo.zipZimVO;

@RestController
public class MemberRestController {
@Autowired
private BCryptPasswordEncoder encoder;

@Autowired
private MemberService service;

@Autowired 
private EstateQnaService qservice;
@PostMapping(value="member/join_ok.do",produces="text/plain;charset=UTF-8")
public String member_join(MemberVO vo)
{
	String result="";
	try
	{
		String en=encoder.encode(vo.getPwd());
		vo.setPwd(en);
		service.MemberInsert(vo);
		result="YES";
	}catch(Exception ex)
	{
		result="NO";
		ex.printStackTrace();
	}
	return result;			
 }
@GetMapping(value="member/id_check.do",produces="text/plain;charset=UTF-8")
 public String member_id_check(String id)
 {
	String result="";
	 try
	 {
		int count=service.memberIdCheck(id);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	 }catch(Exception ex)
	 {
		 
	 }
	return result;
 }
@GetMapping(value="member/nick_check.do",produces="text/plain;charset=UTF-8")
 public String member_nick_check(String nickname)
 {
	String result="";
	try
	{
		int count=service.memberNickCheck(nickname);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
 }
@GetMapping(value="member/email_check.do",produces="text/plain;charset=UTF-8")
public String member_email_check(String email)
{
	String result="";
	try
	{
		int count=service.memberEmailCheck(email);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
}
@GetMapping(value="member/phone_check.do",produces="text/plain;charset=UTF-8")
public String member_phone_check(String phone)
{
	String result="";
	try
	{
		int count=service.memberPhoneCheck(phone);
		if(count==0)
		{
			result="yes";
		}
		else
		{
			result="no";
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
}
@PostMapping(value="member/login_ok.do",produces="text/plain;charset=UTF-8")
public String member_login(String id, String pwd,boolean ck,HttpSession session,HttpServletResponse response)
{
	String result="";
	try
	{
		int count=service.memberIdCheck(id);
		if(count==0)
		{
			result="noid";
		}
		else //count=1 아이디 있음 => pwd 비교
		{
			MemberVO vo= service.memberLogin(id);
			if(encoder.matches(pwd, vo.getPwd())) // pwd 일치
			{
				session.setAttribute("name", vo.getName());
				session.setAttribute("sex", vo.getSex());
				session.setAttribute("id", vo.getId());
				session.setAttribute("admin", vo.getAdmin());
				session.setAttribute("nickname", vo.getNickname());
				session.setAttribute("pwd", vo.getPwd());
				result="yes";
				Cookie cookie=null;
				if(ck==true)
				{
					cookie=new Cookie("id", id);
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
					
					cookie=new Cookie("name", vo.getName());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
					
					
				}
				else
				{
					if(cookie!=null)
					{
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
			else // pwd다름
			{
				result="nopwd";
			}
		}
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return result;
}
@GetMapping(value="member/mypage_vue.do",produces="text/plain;charset=UTF-8")
public String memberInfo(String id) throws Exception
{
	
	MemberVO vo=service.memberInfo(id);
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(vo);
	return json;
}
@PostMapping(value="member/pwd_ok.do",produces="text/plain;charset=UTF-8")
public String memberPwdCheck(String id,String pwd)
{
	String result="";
	String password=service.memberPwdCheck(id);
	if(encoder.matches(pwd, password))
	{
		result="yes";
	}
	else
	{
		result="no";
	}
	return result;
}
@PostMapping(value="member/update.do",produces="text/plain;charset=UTF-8")
public String memberUpdate(MemberVO vo)
{
	String result="";
	System.out.println(vo.getId());
	try
	{
		String en=encoder.encode(vo.getPwd());
		vo.setPwd(en);
		service.memberUpdate(vo);
		result="yes";
	}catch(Exception ex)
	{
		result="no";
		ex.printStackTrace();
	}
	return result;		
}
@PostMapping(value="member/delete_ok.do",produces="text/plain;charset=UTF-8")
public String memberDelete(String id,String pwd,HttpSession session)
{
	String result="";
	String password=service.memberPwdCheck(id);
	if(encoder.matches(pwd, password))
	{
		session.invalidate();
		result="yes";
		service.memberDelete(id);
	}
	else
	{
		result="no";
	}
	return result;
}
 @GetMapping(value="member/member_find.do",produces="text/plain;charset=UTF-8")
 public String member_find(int page,String col,String fd) throws Exception
 {
	 
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 int rowSize=10;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=rowSize*page;
	 map.put("start",start);
	 map.put("end", end);
	 List<MemberVO> mlist=service.memberFindData(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(mlist);
	 return json;
 }
 @GetMapping(value="member/member_page.do",produces="text/plain;charset=UTF-8")
 public String member_page(int page,String col,String fd) throws Exception
 {
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 int totalpage=service.memberTotalPage(map);
	 
	 final int BLOCK=5;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
	 
 }
 @PostMapping(value="member/member_ban.do",produces="text/plain;charset=UTF-8")
 public String member_ban(String id)
 {
	 
	 String result="";
	try
	{
		
	  service.memberDelete(id);
	  result="yes";
	}catch(Exception ex) {
	  result="no";	
	}
	return result;
	
 }
 @GetMapping(value="member/customer_zip.do",produces="text/plain;charset=UTF-8")
 public String customer_zip(int page,String col,String fd,String name) throws Exception
 {
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 map.put("name", name);
	 int rowSize=10;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start",start);
	 map.put("end", end);
	 List<EstateDetailVO> list=service.zipTypeData(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/customer_page.do",produces="text/plain;charset=UTF-8")
 public String customer_page(int page,String col,String fd,String name) throws Exception
 {
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("fd", fd);
	 map.put("name", name);
	 int totalpage=service.zipBuyTotalPage(map);
	 
	 final int BLOCK=5;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 @GetMapping(value="member/answer.do",produces="text/plain;charset=UTF-8")
 public String member_answer(int page, String company) throws Exception
 {
	 Map map=new HashMap();
	 map.put("company", company);
	 
	 int rowSize=5;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=rowSize*page;
	 map.put("start", start);
	 map.put("end", end);
	 
	 List<EstateQnaVO> list=qservice.estateQnaCompanyListData(map);
	 ObjectMapper mapper=new ObjectMapper();
	 
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/answer_page.do",produces="text/plain;charset=UTF-8")
 public String answer_page(int page,String company) throws Exception
 {
	 Map map=new HashMap();
	 
	 map.put("company", company);
	 int totalpage=qservice.customerTotalPage(map);
	 
	 final int BLOCK=5;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 @PostMapping(value="member/answer_insert.do",produces="text/plain;charset=UTF-8")
 public String answer_insert(int no, String content) throws Exception
 {
	 Map map=new HashMap();
	 System.out.println("no:"+no);
	 System.out.println("content: "+content);
	 map.put("no", no);
	 map.put("content", content);
	 
	 String result=qservice.estateQnaUpdate(map); // 답변
	 return result;
	 
 }
 @GetMapping(value="member/question.do",produces="text/plain;charset=UTF-8")
 public String question_list(int page, String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);
	 int rowSize=5;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=rowSize*page;
	 map.put("start", start);
	 map.put("end", end);
	 List<EstateQnaVO> list=qservice.estateQnaUserListData(map);
	 ObjectMapper mapper=new ObjectMapper();
	 
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/question_page.do",produces="text/plain;charset=UTF-8")
 public String question_page(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 
	 map.put("id", id);
	 int totalpage=qservice.userTotalPage(map);
	 
	 final int BLOCK=5;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 //////////////////////// 인테리어 찜
 @GetMapping(value = "member/inteZim_list.do",produces = "text/plain;charset=UTF-8")
	public String inteZim_list(int page,String id) throws Exception
	{
		Map map=new HashMap();
		map.put("id", id);
		int rowSize=8;
		int start=(rowSize*page)-(rowSize-1);
		int end=(rowSize*page);
		map.put("start", start);
		map.put("end", end);
		List<InteVO> list=service.inteLike(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value="member/inte_zim_page.do",produces="text/plain;charset=UTF-8")
	public String zim_page(int page, String id) throws Exception
	{
		 Map map=new HashMap();
		 map.put("id", id);		 
		 int totalpage=service.inteLikeTotalPage(map);
		 
		
		 
		 final int BLOCK=3;
		 int startPage=((page-1)/BLOCK*BLOCK)+1;
		 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		 if(endPage>totalpage)
			 endPage=totalpage;
		 
		 PageVO vo=new PageVO();
		 vo.setCurpage(page);
		 vo.setTotalpage(totalpage);
		 vo.setStartPage(startPage);
		 vo.setEndPage(endPage);
		 
		 ObjectMapper mapper=new ObjectMapper();
		 String json=mapper.writeValueAsString(vo);
		 return json;
	}
	@GetMapping(value="member/inteZim_delete.do",produces = "text/plain;charset=UTF-8")
	public String zipZim_list_delete(String id,int ino)
	{
		InteLikeVO vo=new InteLikeVO();
		vo.setId(id);
		vo.setIno(ino);
		String result="";
		try
		{
			service.inteZimDelete(vo);
			result="yes";
		}catch(Exception ex)
		{
			ex.printStackTrace();
			result="no";
		}
		return result;
	}
	@GetMapping(value = "member/moveZim_list.do",produces = "text/plain;charset=UTF-8")
	public String moveZim_list(int page,String id) throws Exception
	{
		Map map=new HashMap();
		map.put("id", id);
		int rowSize=8;
		int start=(rowSize*page)-(rowSize-1);
		int end=(rowSize*page);
		map.put("start", start);
		map.put("end", end);
		List<MoveVO> list=service.moveZzim(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value="member/movezim_page.do",produces="text/plain;charset=UTF-8")
	public String movezim_page(int page, String id) throws Exception
	{
		 Map map=new HashMap();
		 map.put("id", id);		 
		 int totalpage=service.moveZzimTotalPage(map);
		 
		
		 
		 final int BLOCK=3;
		 int startPage=((page-1)/BLOCK*BLOCK)+1;
		 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		 if(endPage>totalpage)
			 endPage=totalpage;
		 
		 PageVO vo=new PageVO();
		 vo.setCurpage(page);
		 vo.setTotalpage(totalpage);
		 vo.setStartPage(startPage);
		 vo.setEndPage(endPage);
		 
		 ObjectMapper mapper=new ObjectMapper();
		 String json=mapper.writeValueAsString(vo);
		 return json;
	}
	@GetMapping(value="member/moveZim_delete.do",produces = "text/plain;charset=UTF-8")
	public String moveZim_delete(String id, int mno)
	{
		MoveJjimVO vo=new MoveJjimVO();
		vo.setId(id);
		vo.setMno(mno);
		String result="";
		try
		{
			service.moveZimDelete(vo);
			result="yes";
		}catch(Exception ex)
		{
			ex.printStackTrace();
			result="no";
		}
		return result;
	}
	@GetMapping(value = "member/cleanZim_list.do",produces = "text/plain;charset=UTF-8")
	public String cleanZim_list(int page,String id) throws Exception
	{
		Map map=new HashMap();
		map.put("id", id);
		int rowSize=8;
		int start=(rowSize*page)-(rowSize-1);
		int end=(rowSize*page);
		map.put("start", start);
		map.put("end", end);
		List<CleanVO> list=service.cleanZzim(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value="member/cleanzim_page.do",produces="text/plain;charset=UTF-8")
	public String cleanzim_page(int page, String id) throws Exception
	{
		 Map map=new HashMap();
		 map.put("id", id);		 
		 int totalpage=service.cleanZzimTotalPage(map);
		 
		
		 
		 final int BLOCK=3;
		 int startPage=((page-1)/BLOCK*BLOCK)+1;
		 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		 if(endPage>totalpage)
			 endPage=totalpage;
		 
		 PageVO vo=new PageVO();
		 vo.setCurpage(page);
		 vo.setTotalpage(totalpage);
		 vo.setStartPage(startPage);
		 vo.setEndPage(endPage);
		 
		 ObjectMapper mapper=new ObjectMapper();
		 String json=mapper.writeValueAsString(vo);
		 return json;
	}
	@GetMapping(value="member/cleanZim_delete.do",produces = "text/plain;charset=UTF-8")
	public String cleanZim_delete(String id, int cno)
	{
		CleanJjimVO vo=new CleanJjimVO();
		vo.setId(id);
		vo.setCno(cno);
		String result="";
		try
		{
			service.cleanZimDelete(vo);
			result="yes";
		}catch(Exception ex)
		{
			ex.printStackTrace();
			result="no";
		}
		return result;
	}
 @GetMapping(value="member/inte_custom_reserve.do", produces="text/plain;charset=UTF-8")
 public String inte_custom_reserve(int page) throws Exception
 {
	 Map map=new HashMap();
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<InteReserveVO> list=service.inte_reserve(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/intereserve_page.do",produces="text/plain;charset=UTF-8")
 public String inte_custom_reserve_page(int page) throws Exception
 {
	 Map map=new HashMap();
	 	 
	 int totalpage=service.inte_reserve_totalPage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 
 @GetMapping(value="member/inte_user_reserve.do", produces="text/plain;charset=UTF-8")
 public String inte_user_reserve(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<InteReserveVO> list=service.inte_user_reserve(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/inte_user_reserve_page.do",produces="text/plain;charset=UTF-8")
 public String inte_user_reserve_page(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);	 
	 int totalpage=service.inte_reserve_totalPage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 @GetMapping(value="member/move_admin_reserve.do",produces="text/plain;charset=UTF-8")
 public String move_admin_reserve(int page) throws Exception
 {
	 Map map=new HashMap();
	 
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=rowSize*page;
	 map.put("start", start);
	 map.put("end", end);
	 
	 List<ReserveMoveVO> list=service.move_admin_reserve(map);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/move_admin_reserve_page.do",produces="text/plain;charset=UTF-8")
 public String move_admin_reserve_page(int page) throws Exception
 {
	 Map map=new HashMap();
 	 
	 int totalpage=service.move_admin_reserve_totalPage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 
 @GetMapping(value="member/clean_admin_reserve.do",produces="text/plain;charset=UTF-8")
 public String clean_admin_reserve(int page) throws Exception
 {
	 Map map=new HashMap();
	 
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=rowSize*page;
	 map.put("start", start);
	 map.put("end", end);
	 
	 List<ReserveCleanVO> list=service.clean_admin_reserve(map);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/clean_admin_reserve_page.do",produces="text/plain;charset=UTF-8")
 public String clean_admin_reserve_page(int page) throws Exception
 {
	 Map map=new HashMap();
 	 
	 int totalpage=service.clean_admin_reserve_totalPage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 
 @GetMapping(value="member/move_user_reserve.do", produces="text/plain;charset=UTF-8")
 public String move_user_reserve(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<ReserveMoveVO> list=service.move_user_reserve(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/move_user_reserve_page.do",produces="text/plain;charset=UTF-8")
 public String move_user_reserve_page(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);	 
	 int totalpage=service.move_user_reserve_totalPage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 @GetMapping(value="member/clean_user_reserve.do", produces="text/plain;charset=UTF-8")
 public String clean_user_reserve(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<ReserveCleanVO> list=service.clean_user_reserve(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/clean_user_reserve_page.do",produces="text/plain;charset=UTF-8")
 public String clean_user_reserve_page(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);	 
	 int totalpage=service.clean_admin_user_totalPage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 
 @GetMapping(value="member/customer_buy.do",produces="text/plain;charset=UTF-8")
 public String customer_zip(String name,int page) throws Exception
 {
	 Map map=new HashMap();
	 
	 map.put("name", name);
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<EstateDetailVO> list=service.customer_zip_buy(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;
 }
 @GetMapping(value="member/customer_buy_page.do",produces="text/plain;charset=UTF-8")
 public String customer_buy_page(int page,String name) throws Exception
 {
	 Map map=new HashMap();
	 map.put("name", name);	 
	 int totalpage=service.customer_zip_buy_totalpage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 ///////////// 장바구니 관리자 
 @GetMapping(value="member/admin_cart.do", produces="text/plain;charset=UTF-8")
 public String admin_cart(int page) throws Exception
 {
	 Map map=new HashMap();
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<ProductCartVO> list=service.admin_cart(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/admin_cart_page.do",produces="text/plain;charset=UTF-8")
 public String admin_cart_page(int page) throws Exception
 {
	 Map map=new HashMap();
	 	 
	 int totalpage=service.admin_cart_totalpage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 
 @GetMapping(value="member/user_cart.do", produces="text/plain;charset=UTF-8")
 public String admin_cart(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<ProductCartVO> list=service.user_cart(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/user_cart_page.do",produces="text/plain;charset=UTF-8")
 public String user_cart_page(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);	 
	 int totalpage=service.user_cart_totalpage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 @GetMapping(value="member/user_cart_delete.do",produces = "text/plain;charset=UTF-8")
	public String user_cart_delete(String id, int cno)
	{
		ProductCartVO vo=new ProductCartVO();
		vo.setId(id);
		vo.setCno(cno);
		String result="";
		try
		{
			service.user_cart_delete(vo);
			result="yes";
		}catch(Exception ex)
		{
			ex.printStackTrace();
			result="no";
		}
		return result;
	}
 @PostMapping(value="member/pwd_update.do",produces="text/plain;charset=UTF-8")
 public String memberPwdUpdate(MemberVO vo)
 {
 	String result="";
 	System.out.println(vo.getId());
 	try
 	{
 		String en=encoder.encode(vo.getPwd());
 		vo.setPwd(en);
 		service.memberPwdUpdate(vo);
 		int count=service.memberIdCheck(vo.getId());
 		if(count==0)
 		{
 			result="noid";
 		}
 		else
 		{	
 		 result="yes";
 		}
 	}catch(Exception ex)
 	{
 		result="no";
 		ex.printStackTrace();
 	}
 	return result;		
 }
 @PostMapping(value="member/idfind.do",produces="text/plain;charset=UTF-8")
 public String memberId(String email) throws Exception
 {
	 
 	String result="";
 	
 	MemberVO vo=service.memberId(email);
 	int count=service.memberEmailCheck(email);
 	if(count==0)
 	{
 		result="이메일이 없습니다.";
 	}
 	else 
 	{
 		String id = vo.getId();
 		for(int i =0 ; i < id.length();i++) {
 			if(i<4) {
 				result+=id.charAt(i);
 			} else {
 				result+="*";
 			}
 		}
 	}
 	return result;
 }
 // 관리자 페이지 구매내역 목록
 @GetMapping(value="member/admin_purchase.do", produces="text/plain;charset=UTF-8")
 public String admin_purchase(int page) throws Exception
 {
	 Map map=new HashMap();
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<ProductCartVO> list=service.admin_purchase(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/admin_purchase_page.do",produces="text/plain;charset=UTF-8")
 public String admin_purchase_page(int page) throws Exception
 {
	 Map map=new HashMap();
	 	 
	 int totalpage=service.admin_purchase_totalpage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 
 /// 사용자 구매내역 페이지
 @GetMapping(value="member/user_purchase.do", produces="text/plain;charset=UTF-8")
 public String user_purchase(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);
	 int rowSize=8;
	 int start=(rowSize*page)-(rowSize-1);
	 int end=(rowSize*page);
	 map.put("start", start);
	 map.put("end", end);
	 List<ProductCartVO> list=service.user_purchase(map);
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(list);
	 return json;

 }
 @GetMapping(value="member/user_purchase_page.do",produces="text/plain;charset=UTF-8")
 public String user_purchase_page(int page,String id) throws Exception
 {
	 Map map=new HashMap();
	 map.put("id", id);	 
	 int totalpage=service.user_purchase_totalpage(map);
	 
	 final int BLOCK=3;
	 int startPage=((page-1)/BLOCK*BLOCK)+1;
	 int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
	 if(endPage>totalpage)
		 endPage=totalpage;
	 
	 PageVO vo=new PageVO();
	 vo.setCurpage(page);
	 vo.setTotalpage(totalpage);
	 vo.setStartPage(startPage);
	 vo.setEndPage(endPage);
	 
	 ObjectMapper mapper=new ObjectMapper();
	 String json=mapper.writeValueAsString(vo);
	 return json;
 }
 @GetMapping(value="member/user_purchase_delete.do",produces = "text/plain;charset=UTF-8")
	public String user_purchase_delete(String id, int cno)
	{
		ProductCartVO vo=new ProductCartVO();
		vo.setId(id);
		vo.setCno(cno);
		String result="";
		try
		{
			service.user_purchase_delete(vo);
			result="yes";
		}catch(Exception ex)
		{
			ex.printStackTrace();
			result="no";
		}
		return result;
	}
}
