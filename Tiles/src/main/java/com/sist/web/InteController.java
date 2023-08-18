package com.sist.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InteController {
	
	@GetMapping("inte/inte_list.do")
	public String inte_list(Model model) {
		return "inte/inte_list";
	}
	
	@GetMapping("inte/inte_detail.do")
	public String inte_detail(int no,Model model) {
		model.addAttribute("no", no);
		return "inte/inte_detail";
	}
}
