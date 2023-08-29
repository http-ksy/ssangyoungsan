package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.ProductDAO;
import com.sist.vo.ProductVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ProductController {
	@Autowired
	private ProductDAO dao;
	
	private String[] titles= {"","가구","패브릭","조명"};
	
	@GetMapping("product/product_list.do")
	public String product_list(int type,Model model)
	{
		model.addAttribute("type",type);
		model.addAttribute("title",titles[type]);
		
		return "product/product_list";
	}
	
  	@GetMapping("product/product_find.do")
	public String product_find(int type,Model model)
	{
  		model.addAttribute("type",type);
		model.addAttribute("title",titles[type]);

		return "main/main";
	}
  	
  	@GetMapping("product/product_detail.do")
  	public String product_detail(int no,int type,Model model)
  	{
  		model.addAttribute("type",type);
  		model.addAttribute("no",no);
  		return "product/product_detail";
  	}
  	
  	@GetMapping("product/product_cart.do")
  	public String product_cart(String id,Model model)
  	{
  		model.addAttribute("id",id);
  		return "product/product_cart";
  	}
  	
  	@RequestMapping("product/product_order.do")
  	public String product_order(HttpSession session,Model model,String select_pri,String []mycheck)
  	{
  		model.addAttribute("select_pri",select_pri);
  		String id=(String)session.getAttribute("id");
  		for(int i=0;i<mycheck.length;i++)
  		{
  			dao.cartBuyUpdate(Integer.parseInt(mycheck[i]));  			
  		}
  		model.addAttribute("id",id);
  		return "product/product_order";
  	}
  	
  	@RequestMapping("product/product_buy.do")
  	public String product_buy(HttpSession session,Model model,String select_pri)
  	{
  		model.addAttribute("select_pri",select_pri);
  		String id=(String)session.getAttribute("id");
  		model.addAttribute("id",id);
  		dao.finalBuyUpdate(id);
  		String buy="d";
  		model.addAttribute("buy",buy);
  		return "product/product_buy";
  	}
  	
}