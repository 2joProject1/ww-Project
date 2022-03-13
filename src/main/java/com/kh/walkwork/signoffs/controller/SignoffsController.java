package com.kh.walkwork.signoffs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SignoffsController {
	
	@RequestMapping("signoffs.docu")
	public String docuEnrollForm(HttpServletRequest request) {
		String format = request.getParameter("format");
		
		if ("1".equals(format)) {
			return "signoffs/documentsEnrollForm";
		} else if("2".equals(format)) {
			return "signoffs/documentsEnrollForm2";
		} else {
			return "signoffs/documentsEnrollForm";
		}
	}
	
	@RequestMapping("docubox.draft")
	public String draftDocuBox() {
		return "signoffs/draftDocuBox";
	}
	
	@RequestMapping("docubox.reseive")
	public String reseiveDocuBox() {
		return "signoffs/reseiveDocuBox";
	}
	
	@RequestMapping("docubox.dept")
	public String deptDocuBox() {
		return "signoffs/deptDocuBox";
	}
	
	@RequestMapping("docubox.reject")
	public String rejectDocuBox() {
		return "signoffs/rejectDocuBox";
	}

}
