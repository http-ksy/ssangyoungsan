package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;


@Controller
public class MainController {
	
	
	@GetMapping("main/main.do")
	public String main_main(Model model) {
		return "main";
	}
}
