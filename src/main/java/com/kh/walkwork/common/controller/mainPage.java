package com.kh.walkwork.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainPage {
	
	@RequestMapping("main")
	public String returnMain(){
		return "common/main";
	}
}
