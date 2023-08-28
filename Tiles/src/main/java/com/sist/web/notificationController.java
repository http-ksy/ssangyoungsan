package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class notificationController {
	
	@GetMapping("noticeboard/notificationboard.do")
	public String landnotice_list() {
		return "noticeboard/notificationboard";
	}
	
	@GetMapping("noticeboard/notificationInsert.do")
	public String landnotice_insert() {
		return "noticeboard/notificationboardinsert";
	}
	@GetMapping("noticeboard/notificationDetail.do")
	public String landnotice_detail(int no,Model model) {
		model.addAttribute("no", no);
		return "noticeboard/notificationboarddetail";
	}
	
	@GetMapping("noticeboard/notificationUpdate.do")
	public String landnotice_update(int no,Model model) {
		model.addAttribute("no", no);
		return "noticeboard/notificationboardupdate";
	}
}
