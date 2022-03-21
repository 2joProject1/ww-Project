package com.kh.walkwork.commute.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.commute.model.service.CommuteServiceImpl;
import com.kh.walkwork.commute.model.vo.Commute;
import com.kh.walkwork.member.model.vo.Member;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteServiceImpl commuteService;
	
	@RequestMapping(value="main.cm", method=RequestMethod.GET)
	public ModelAndView commuteMain(HttpSession session, ModelAndView mv, String year, String month) {
		//String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		
		String memberNo = "12345";
		Commute commute = new Commute();

		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDateTime now = LocalDateTime.now();
		// 포맷 정의
		DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yyyy");
		DateTimeFormatter monthFormatter = DateTimeFormatter.ofPattern("MM");
		// 포맷 적용
		if(year == null || year == "") {
			year = now.format(yearFormatter);
		}
		if(month == null || month == "") {
			month = now.format(monthFormatter);
		}
		commute.setMemberNo(memberNo);
		commute.setCommuteDate(year + "-" + month);
		
		int listCount = commuteService.selectListCount(commute);
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 10, 10); 
		ArrayList<Commute> list = commuteService.selectListCommute(commute, pi);
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.setViewName("commute/commuteView");
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		return mv;
	}
	
	@RequestMapping("month.cm")
	public String commuteMonth() {
		return "commute/workingHourView";
	}
	
	// 출근
	@RequestMapping("on.cm") 
	public ModelAndView commuteOn(HttpSession session, ModelAndView mv) {
		//String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memberNo = "12345";
		Commute commute = new Commute();
		
		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDateTime now = LocalDateTime.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter time = DateTimeFormatter.ofPattern("HH:mm:ss");
		// 포맷 적용
		String commuteDate = now.format(formatter);
		String commuteStart = now.format(time);
		commute.setMemberNo(memberNo);
		commute.setCommuteDate(commuteDate);
		int check = commuteService.checkCommute(commute);
		
		if(check > 0) {
			mv.addObject("alertMsg", "이미 출근하였습니다.");
		}else {
			int commuteTime  = 9;
			int realTime = Integer.parseInt(commuteStart.substring(0,2));
			
			if(commuteTime > realTime) {
				commute.setWorkStatus("Y");
			}else {
				commute.setWorkStatus("N");
			}
			commute.setCommuteStart(commuteStart);
			
			int result = commuteService.insertCommute(commute);
			
			if(result > 0) {
				mv.addObject("alertMsg", "출근 완료");
			}else {
				mv.addObject("alertMsg", "다시 시도하세요");
			}
		}
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	// 퇴근
	@RequestMapping("off.cm")
	public ModelAndView commuteOff(HttpSession session, ModelAndView mv) {
		//String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memberNo = "12345";
		Commute commute = new Commute();
		
		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDateTime now = LocalDateTime.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter time = DateTimeFormatter.ofPattern("HH:mm:ss");
		// 포맷 적용
		String commuteDate = now.format(formatter);
		String commuteEnd = now.format(time);
		commute.setMemberNo(memberNo);
		commute.setCommuteDate(commuteDate);
		int check = commuteService.checkEnd(commute);

		if(check > 0) {
			mv.addObject("alertMsg", "이미 퇴근했습니다");
		}else {
			int commuteTime = 18;
			int realTime = Integer.parseInt(commuteEnd.substring(0,2));
			int checkLate = commuteService.checkLate(commute);
			
			if(commuteTime <= realTime && checkLate != 1) {
				commute.setWorkStatus("Y");
			}else if(checkLate != 1 && commuteTime > realTime){
				commute.setWorkStatus("E");
			}else {
				commute.setWorkStatus("L");
			}
			commute.setCommuteEnd(commuteEnd);
			
			int result = commuteService.updateCommute(commute);
			
			if(result > 0) {
				mv.addObject("alertMsg", "퇴근 완료");
			}else {
				mv.addObject("alertMsg", "다시 시도해주세요");
			}
		}
		
		mv.setViewName("redirect:/");
		return mv;
	}

}
