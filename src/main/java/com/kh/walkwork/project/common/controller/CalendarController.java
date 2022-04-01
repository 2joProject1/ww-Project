package com.kh.walkwork.project.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping("calendar.pj")
	public String calendar() {
		return "project/common/calendar";
	}

}
