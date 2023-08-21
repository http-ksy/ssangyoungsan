package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.*;
import com.sist.vo.*;
@Controller
public class ZipController {
	@Autowired
	private ZipService service;
	@GetMapping("zip/zip_list.do")
	public String zip_list()
	{
		return "zip/zip_list";
	}
	@GetMapping("zip/zip_detail.do")
	public String zip_detail(int no,Model model)
	{
		EstateDetailVO vo=service.EstateDetailData(no);
		String addr=vo.getAddr();
		model.addAttribute("addr",addr);
		model.addAttribute("no",no);
		return "zip/zip_detail";
	}
}
