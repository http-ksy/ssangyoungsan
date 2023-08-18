package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class landboardController {
	
	@GetMapping("sotong/haeyo.do")
	public String landboard() {
		return "landboard/landboard";
	}
}
