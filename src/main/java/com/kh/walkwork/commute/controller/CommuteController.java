package com.kh.walkwork.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuteController {
	
	@RequestMapping("main.cm")
	public String commuteMain() {
		return "commute/commuteView";
	}

}
