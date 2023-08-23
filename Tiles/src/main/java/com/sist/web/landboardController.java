package com.sist.web;

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
}
