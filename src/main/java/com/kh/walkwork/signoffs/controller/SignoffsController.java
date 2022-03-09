package com.kh.walkwork.signoffs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SignoffsController {
	
	@RequestMapping("signoffs.docu")
	public String docuEnrollForm(HttpServletRequest req) {
		String format = req.getParameter("format");
		
		if ("1".equals(format)) {
			return "signoffs/documentsEnrollForm";
		} else if("2".equals(format)) {
			return "signoffs/documentsEnrollForm2";
		} else {
			return "signoffs/documentsEnrollForm";
		}
	}
	
	
	
	
}
