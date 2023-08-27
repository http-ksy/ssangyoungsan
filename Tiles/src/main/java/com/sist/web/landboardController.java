package com.sist.web;

import java.io.*;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class landboardController {
	
	@GetMapping("sotong/haeyo.do")
	public String landboard() {
		return "landboard/landboard";
	}
	@GetMapping("landboard/landinsert.do")
	public String landboard_insert() {
		return "landboard/landinsert";
	}
	@GetMapping("landboard/detail.do")
	public String landboard_detail(int no,Model model) {
		model.addAttribute("no", no);
		return "landboard/landdetail";
	}
/*
 * <li><a href="../sotong/haeyo.do">소통게시판</a></li>
<li><a href="../landboard/notificationboard.do">공지게시판</a></li>
<li><a href="../landboard/qna.do">묻고답하기</a></li>
 */
	@GetMapping("landboard/notificationboard.do")
	public String landboard_notificationboard(){
		return "landboard/notificationboard";
	}
	@GetMapping("landboard/qna.do")
	public String landboard_qna() {
		return "landboard/qna";
	}
	@GetMapping("databoard/download.do")
	   public void databoard_download(String fn,
			   HttpServletRequest request,HttpServletResponse response)
	   {
		   String path=request.getSession().getServletContext().getRealPath("/")+"upload/";
		   path=path.replace("\\", File.separator);
		   try
		   {
			   File file=new File(path+fn);
			   response.setHeader("Content-Disposition", "attachement;filename="
					   +URLEncoder.encode(fn,"UTF-8"));
			   response.setContentLength((int)file.length());
			   
			   BufferedInputStream bis=
					   new BufferedInputStream(new FileInputStream(file));
			   BufferedOutputStream bos=
					   new BufferedOutputStream(response.getOutputStream());
			   int i=0; 
			   byte[] buffer=new byte[1024];
			   while((i=bis.read(buffer, 0, 1024))!=-1)
			   {
				   bos.write(buffer, 0, i);
			   }
			   bis.close();
			   bos.close();
		   }catch(Exception ex){}
	   }
}
