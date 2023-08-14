package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MoveController {
	@GetMapping("move/list.do")
	public String move_list() {
		return "move/list";
	}
	@GetMapping("move/detail.do")
	public String move_detail() {
		return "move/detail";
	}
}
