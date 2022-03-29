package com.kh.walkwork.dayOff.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.dayOff.model.service.DayOffServiceImpl;
import com.kh.walkwork.dayOff.model.vo.DayOff;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.notice.model.vo.Notice;

@Controller
public class DayOffController {
	
	@Autowired
	private DayOffServiceImpl dayOffService;
	
	@RequestMapping(value = "insert.of", method=RequestMethod.POST)
	public ModelAndView insertOff(DayOff off, ModelAndView mv, HttpSession session) {
		
		int result = dayOffService.insertOff(off);
		
		if(result > 0) { //성공
			session.setAttribute("alertMsg", "신청완료");
		}else {
			session.setAttribute("alertMsg", "신청실패");
		}
		int listCount = dayOffService.selectCountOff(off.getOffWriter());
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 10, 10); 
		ArrayList<DayOff> list = dayOffService.selectListOff(off.getOffWriter(), pi);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("off/offView");
		return mv;
	}
	
	@RequestMapping(value = "list.of")
	public ModelAndView listOff(ModelAndView mv, HttpSession session) {
		
		String offWriter = ((Member)session.getAttribute("loginUser")).getMemberNo();
		int listCount = dayOffService.selectCountOff(offWriter);
		//System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 10, 10); 
		//System.out.println(pi);
		ArrayList<DayOff> list = dayOffService.selectListOff(offWriter, pi);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("off/offView");
		return mv;
	
	}
	
	@RequestMapping("searchList.of") 
	public ModelAndView listOff(ModelAndView mv, HttpSession session, DayOff off) {
		System.out.println(off);
		int listCount = dayOffService.searchCountOff(off);
		//System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 10, 10); 
		//System.out.println(pi);
		ArrayList<DayOff> list = dayOffService.searchListOff(off, pi); 
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("off/offView");
		return mv;
	
	}
	
	@RequestMapping("status.of")
	public String offStatus() {
		return "off/offStatusView";
	}
	
	@RequestMapping(value = "approval.of")
	public ModelAndView offApproval(ModelAndView mv, HttpSession session) {
		int deptNo = Integer.parseInt(((Member)session.getAttribute("loginUser")).getDeptNo());
		int listCount = dayOffService.adminSelectCountOff(deptNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 10, 10); 
		ArrayList<DayOff> list = dayOffService.adminSelectListOff(deptNo, pi);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("off/offApprovalView");
		return mv;
	}
	
	@RequestMapping(value = "yesOrNo.of", method=RequestMethod.GET)
	public String offApproval(String status, int offNo, HttpSession session) {
		
		DayOff off = new DayOff();
		off.setStatus(status);
		off.setOffNo(offNo);
		int result = dayOffService.adminApprovalOff(off);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "승인완료");
		}else {
			session.setAttribute("alertMsg", "승인실패");
		}
		
		return "redirect:/approval.of";
	}
	
	@RequestMapping("searchApproval.of") 
	public ModelAndView offApproval(ModelAndView mv, HttpSession session, DayOff off) {
		System.out.println(off);
		int listCount = dayOffService.adminSearchCountOff(off);
		//System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 10, 10); 
		//System.out.println(pi);
		ArrayList<DayOff> list = dayOffService.adminSearchListOff(off, pi);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		mv.setViewName("off/offApprovalView");
		return mv;
	
	}
	
	@ResponseBody
	@RequestMapping("selectDto.of")
	public List<Object> selectDto(){
		List<Object> list = dayOffService.selectDto();
		
		return list;
	}
	
}
