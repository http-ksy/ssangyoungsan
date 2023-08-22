package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	private String[] titles= {"","가구","패브릭","조명"};
	@GetMapping("product/product_list.do")
	public String product_list(int type,Model model)
	{
		model.addAttribute("type",type);
		model.addAttribute("title",titles[type]);
		model.addAttribute("main_jsp","../product/product_list.jsp");
		return "product/product_list";
	}
	
  	@GetMapping("product/product_find.do")
	public String product_find(int type,Model model)
	{
  		model.addAttribute("type",type);
		model.addAttribute("title",titles[type]);
		model.addAttribute("main_jsp","../product/product_find.jsp");
		return "main/main";
	}
  	
  	
  	@GetMapping("product/product_detail.do")
  	public String product_detail(int no,int type,Model model)
  	{
  		model.addAttribute("type",type);
  		model.addAttribute("no",no);
  		System.out.println("type"+type);
  		System.out.println("no"+no);
  		return "product/product_detail";
  	}
}