package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CleanController {
	@GetMapping("clean/list.do")
	public String clean_list() {
		return "clean/list";
	}
	@GetMapping("clean/detail.do")
	public String clean_detail(int cno,Model model) {
		model.addAttribute("cno", cno);
		return "clean/detail";
	}
}
