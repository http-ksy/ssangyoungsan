package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class ContentRestController {
	@Autowired
	private ContentService service;
	@GetMapping(value = "main/content_estate_vue.do" , produces = "text/plain;charset=UTF-8")
	public String content_estate() throws Exception
	{
		List<EstateDetailVO> list=service.estateRandomList();
		for(EstateDetailVO vo:list)
		{
			String img=vo.getImg();
			img=img.substring(0,img.indexOf("^"));
			System.out.println("img===="+img);
			vo.setImg(img);
		}
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
}
