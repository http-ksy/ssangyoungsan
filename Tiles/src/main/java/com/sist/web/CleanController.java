package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CleanController {
	@GetMapping("clean/list.do")
	public String clean_list() {
		return "clean/list";
	}
	@GetMapping("clean/detail.do")
	public String clean_detail() {
		return "clean/detail";
	}
}
