package com.sist.web;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
@RestController
public class ProductRestController {
	@Autowired
	private ProductDAO dao;
	
	private String[] tables= {"","gagu_detail","fabric_detail","light_detail"};
	
	@GetMapping(value = "product/product_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_list(int page,int type) throws Exception
	{
		Map map=new HashMap();
		int rowSize=21;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		map.put("start", start);
		map.put("end", end);
		map.put("table_name", tables[type]);
		List<ProductVO> list=dao.productListData(map);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "product/product_page_info_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_page_info(int page, int type) throws Exception
	{
		Map map=new HashMap();
		map.put("table_name", tables[type]);
		int totalpage=dao.productTotalPage(map);
		PageVO vo=new PageVO();
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalpage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "product/product_find_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_find_vue(int page,int type,String fd) throws Exception
	{
		if(fd==null || fd.equals(""))
		{
			fd="";
		}

		   Map map=new HashMap();
		   int rowSize=21;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   map.put("start", start);
		   map.put("end", end);
		   map.put("fd", fd);
		   map.put("table_name", tables[type]);
		   // DAO
		   List<ProductVO> list=dao.productFindData(map);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	}
	
	@GetMapping(value="product/page_info_vue.do",produces = "text/plain;charset=UTF-8")
	   public String page_info(int page,int type,String title,String fd)
	   throws Exception
	   {
		   if(fd==null || fd.equals(""))
		   {
			   fd="";
		   }
		   Map map=new HashMap();
		   map.put("table_name", tables[type]);
		   map.put("fd", fd);
		   
		   int count=dao.productFindCount(map);
//		   System.out.println("count="+count);
//		   System.out.println("fd="+fd);
		   int totalpage=(int)(Math.ceil(count/20.0));
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
		      endPage=totalpage;
		   
		   PageVO vo=new PageVO();
		   vo.setTotalpage(totalpage);
		   vo.setCurpage(page);
		   vo.setStartPage(startPage);
		   vo.setEndPage(endPage);
		   vo.setCount(String.valueOf(count));
		   
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
	
	@GetMapping(value = "product/product_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String product_detail(int no,int type) throws Exception
	{
		Map map=new HashMap();
		map.put("table_name", tables[type]);
		map.put("no", no);
		ProductVO vo=dao.productDetailData(map);
		String original_pri=vo.getOriginal_pri().replaceAll("[^0-9]", "");
		vo.setOriginal_pri(original_pri);
        String priced_sale = vo.getPriced_sale() != null ? vo.getPriced_sale().replaceAll("[^0-9]", "") : "";
		vo.setPriced_sale(priced_sale);
		String sale=vo.getSale();
		vo.setSale(sale);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	// 장바구니
	@PostMapping(value = "product/cart_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String cart_insert(ProductCartVO vo,HttpSession session)
	{
		String result="";
		try
		{
			String id=(String)session.getAttribute("id");
			vo.setId(id);
			dao.cartInsert(vo);		
			result="yes";
			
		}catch(Exception ex) 
		{
			ex.printStackTrace();
			result="no";
		}
		
		return result;
	}
	
	@GetMapping(value = "product/cart_read_vue.do",produces = "text/plain;charset=UTF-8")
	public String cart_read(String id) throws Exception  //int no,int type
	{
		Map map=new HashMap();
		map.put("id", id);
		//map.put("table_name", tables[type]);
		//map.put("no", no);
		//System.out.println("no:"+no);
		//System.out.println("type:"+tables[type]);
	//	System.out.println("id:"+no);
		List<ProductCartVO> list=dao.cartListData(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "product/cart_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String cart_delete(int cno,String id)
	{
		String result="";
		try
		{
			dao.cartDelete(cno);
			result="yes";
			
		}catch(Exception ex) 
		{
			ex.printStackTrace();
			result="no";
		}
		
		return result;
	}
	@GetMapping(value = "product/cart_alldelete_vue.do",produces = "text/plain;charset=UTF-8")
	public String cart_alldelete(String id)
	{
		String result="";
		try
		{
			dao.cartAllDelete(id);
			result="yes";
			
		}catch(Exception ex) 
		{
			ex.printStackTrace();
			result="no";
		}
		
		return result;
	}
	
	// 결제페이지
	@PostMapping(value = "product/order_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String order_insert(ProductOrderVO vo,HttpSession session,String id) throws Exception
	{
		
		
		//String result="";
	//	try
	//	{
			id=(String)session.getAttribute("id");
			vo.setId(id);	
		     System.out.println("ono: "+vo.getOno());
		     System.out.println("tt: "+vo.getTitle());
		     System.out.println("id: "+vo.getId());
		     System.out.println("brand: "+vo.getBrand());
			dao.orderInsert(vo);		
			//result="yes";
			
			
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			return json;
			
		//}catch(Exception ex) 
		//{
			//ex.printStackTrace();
			//result="no";
	//}
		
		//return result;
	}

//			int no=vo.getNo();
//			vo.setNo(no);
//			int type=vo.getType();
//			vo.setType(type);
//			String brand=vo.getBrand();
//			vo.setBrand(brand);
//			String poster=vo.getPoster();
//			vo.setPoster(poster);	
	
	@GetMapping(value = "product/product_order_vue.do",produces = "text/plain;charset=UTF-8")
	public String order_read(String id) throws Exception
	{
		Map map=new HashMap();
		map.put("id", id);
		List<ProductOrderVO> list=dao.orderListData(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
}