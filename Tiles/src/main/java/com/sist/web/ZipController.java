package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ZipController {
	@GetMapping("zip/zip_list.do")
	public String zip_list()
	{
		return "zip/zip_list";
	}
	@GetMapping("zip/zip_detail.do")
	public String zip_detail(int no,Model model)
	{
		model.addAttribute("no",no);
		return "zip/zip_detail";
	}
}
