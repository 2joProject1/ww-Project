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
import org.springframework.web.bind.annotation.RequestParam;
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
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 5, 5); 
		//System.out.println(pi);
		ArrayList<DayOff> list = dayOffService.selectListOff(offWriter, pi);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		System.out.println(list);
		int myOff= 0;
		for(int i =0; i<list.size(); i++) {
			System.out.println(list.get(i).getOffDays());
			myOff = myOff + list.get(i).getOffDays(); 
		}
		mv.addObject("myOff", myOff);
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
	public ModelAndView offApproval(ModelAndView mv, HttpSession session, @RequestParam(value = "cpage", defaultValue = "1") int currentPage, 
			@RequestParam(value = "searchPage", defaultValue = "1") int searchPage, 
			@RequestParam(value = "offStart", defaultValue = "") String offStart, 
			@RequestParam(value = "offEnd", defaultValue = "") String offEnd) {
		int offDept = Integer.parseInt(((Member)session.getAttribute("loginUser")).getDeptNo());
		System.out.println(searchPage);
		if(searchPage == 1) {
			
			int listCount = dayOffService.adminSelectCountOff(offDept);
			//(총게시물, 페이지넘버, 페이지당개수, 페이징개수)
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10); 
			ArrayList<DayOff> list = dayOffService.adminSelectListOff(offDept, pi);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
		}else {
			DayOff off = new DayOff();
			off.setOffDept(offDept);
			off.setOffStart(offStart);
			off.setOffEnd(offEnd);
			System.out.println(off);
			int listCount = dayOffService.adminSearchCountOff(off);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10); 
			ArrayList<DayOff> list = dayOffService.adminSearchListOff(off, pi);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			
		}
		mv.addObject("offStart",offStart);
		mv.addObject("offEnd",offEnd);
		mv.addObject("searchPage",searchPage);
		
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
			session.setAttribute("alertMsg", "확인되었습니다.");
		}else {
			session.setAttribute("alertMsg", "승인실패");
		}
		
		return "redirect:/approval.of";
	}
	
	@RequestMapping("searchApproval.of") 
	public ModelAndView offApproval(ModelAndView mv, HttpSession session, DayOff off, @RequestParam(value = "cpage", defaultValue = "1") int currentPage) {
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
	@RequestMapping(value="selectDto.of", produces="application/json; charset=UTF-8" )
	public List<Object> selectDto(int memberNo){
		
		List<Object> list = dayOffService.selectDto(memberNo);		
		return list;
	}
	@ResponseBody
	@RequestMapping(value="adminSelectDto.of",  produces="application/json; charset=UTF-8")
	public List<Object> adminSelectDto(int deptNo){
		
		List<Object> list = dayOffService.adminSelectDto(deptNo);		
		return list;
	}
	
	
	
}
