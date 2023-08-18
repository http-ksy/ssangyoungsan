package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class landboardController {
	
	@GetMapping("sotong/haeyo.do")
	public String landboard() {
		return "landboard/landboard";
	}
	@GetMapping("landboard/landinsert.do")
	public String landboard_insert() {
		return "landboard/landinsert";
	}
}
