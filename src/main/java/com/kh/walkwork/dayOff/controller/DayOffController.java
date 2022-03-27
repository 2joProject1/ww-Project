package com.kh.walkwork.dayOff.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.dayOff.model.service.DayOffServiceImpl;
import com.kh.walkwork.dayOff.model.vo.DayOff;

@Controller
public class DayOffController {
	
	@Autowired
	private DayOffServiceImpl dayOffService;
	
	@RequestMapping(value = "insert.of", method=RequestMethod.POST)
	public ModelAndView insertOff(DayOff off, ModelAndView mv, HttpSession session) {
	System.out.println(off);	
	
	
		int result = dayOffService.insertOff(off);
		
		if(result > 0) { //성공
			session.setAttribute("alertMsg", "신청완료");
		}else {
			session.setAttribute("alertMsg", "신청실패");
		}
		int listCount = dayOffService.selectCountOff(off.getOffWriter());
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 5, 5); 
		ArrayList<DayOff> list = dayOffService.selectListOff(off.getOffWriter(), pi);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("off/offView");
		return mv;
	}
	
	@RequestMapping(value = "list.of")
	public ModelAndView insertOff(ModelAndView mv, HttpSession session) {
		
		// String offWriter = (Member)session.getAttribute("loginUser").getMemberNo();
		String offWriter = "12345";
		int listCount = dayOffService.selectCountOff(offWriter);
		//System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 5, 5); 
		//System.out.println(pi);
		ArrayList<DayOff> list = dayOffService.selectListOff(offWriter, pi);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("off/offView");
		return mv;
	
	}
	
	@RequestMapping("status.of")
	public String offStatus() {
		return "off/offStatusView";
	}
	
//	@RequestMapping(value = "approval.of")
//	public String offApproval(ModelAndView mv, HttpSession session) {
//		// String offWriter = (Member)session.getAttribute("loginUser").getMemberNo();
//		String offWriter = "12345";
//		
//		if(offWriter != )
//		
//		
//		mv.setViewName("off/offApprovalView");
//		return mv;
//	}
	
	
	
	
}
