package com.kh.walkwork.commute.controller;

import java.math.BigDecimal;
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
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 30, 30); 
		ArrayList<Commute> list = commuteService.selectListCommute(commute, pi);
		mv.addObject("year", year);
		mv.addObject("month", month);
		mv.setViewName("commute/commuteView");
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		
		return mv;
	}
	
	@RequestMapping("month.cm")
	public ModelAndView commuteMonth(HttpSession session, ModelAndView mv, String year, String month) {
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
		
		int listCount = commuteService.selectMonthCount(commute);
		ArrayList<Commute> list = commuteService.selectMonthList(commute);
		mv.addObject("year", year);
		mv.addObject("month", month);
		for (int i= (list.size()-1); i>= 0; i--) {
			
			// 출근시간 
			String commuteStart = list.get(i).getCommuteStart();
			// 퇴근시간
			String commuteEnd = list.get(i).getCommuteEnd();
			
			// 출근시간에서 필요한 시간 값을 구한다 substring 함수를 이용해서 0번쨰 인덱스 부터 2번째 인덱스 전까지
			// 08:55:11 -> 0 : 0번 인덱스 , 8 : 1번 인덱스 
			int startHH = Integer.parseInt(commuteStart.substring(0,2));
			// 퇴근시간에 있는 시간값 구하기 
			int endHH = Integer.parseInt(commuteEnd.substring(0,2));
			
			//출근시간에서 분구하기
			int startMM = Integer.parseInt(commuteStart.substring(3,5));
			//퇴근시간에서 분 구하기
			int endMM = Integer.parseInt(commuteEnd.substring(3,5));
			
			System.out.println("startHH ::: " + startHH);
			System.out.println("endHH ::: " + endHH);
			System.out.println("startMM ::: " + startMM);
			System.out.println("endMM ::: " + endMM);
			
			// .00 식으로 사용해야 하니까 더블형으로 바꿔 줌
			// 퇴근시간에서 출근시간 빼기 = 근무 시간
			double hh = endHH - startHH;
			// 퇴근 분 에서 출근 분 빼기 = 근무 분 
			double mm = endMM - startMM;
			System.out.println("hh ::: " + hh);
			System.out.println("mm ::: " + mm);
			// 5 - 50 = -45
			// 분 끼리 계산 했을 때 마이너스 인 경우는 시간에서 한시간 빼준다
			if(mm < 0) {
				hh = hh-1;
			}
			// 마이너스 일때 양수로 바꿔준다 abs => 절대 양수로 바꿔주는 함수
			mm = Math.abs(mm);
			// '/60' 나눈 이유는 시간은 60분이니까 백분율화 한것
			mm = mm/60;
			
			// BigDecimal 를 쓴 이유 -> 
			// double 형 끼리 계산 할 경우 컴퓨터가 멍청(0,1 밖에 모르기때문에) 해서 소수점 계산을 오류가 날 경우가 생김
			BigDecimal bighh = new BigDecimal(String.valueOf(hh));
			BigDecimal bigmm = new BigDecimal(String.valueOf(mm));
			// 근무시간 + 근무분(백분율) 더해줌 
			BigDecimal bigdayWorkTime = bighh.add(bigmm);
			// 다시 더블형으로 바꾼다 doubleValue();
			double dayWorkTime = bigdayWorkTime.doubleValue();
			
			System.out.println("dayWorkTime ::: hh + mm :::" + dayWorkTime);
			
			// 소수점 2번째 자리까지 반올림 round 함수 이용
			dayWorkTime = (Math.round(dayWorkTime * 100) / 100.0);
			System.out.println("dayWorkTime ::: " + dayWorkTime);
			
			list.get(i).setDayWorkTime(dayWorkTime);
			// 첫번째 인덱스는 누적시간이 없기때문에 당일 시간을 누적시간에 바로 넣어줌 
			if(i==(list.size()-1)) {
				list.get(i).setAccureMonth(list.get(i).getDayWorkTime());
			}else {
				
				//현재 까지 누적된 근무시간
				BigDecimal bigaccureMonthA = new BigDecimal(String.valueOf(list.get(i+1).getAccureMonth()));
				// 당일 근무 시간
				BigDecimal bigaccureMonthB = new BigDecimal(String.valueOf(list.get(i).getDayWorkTime()));
				BigDecimal bigaccureMonth = bigaccureMonthA.add(bigaccureMonthB);
				list.get(i).setAccureMonth(bigaccureMonth.doubleValue());
			}
			
			System.out.println("월 누적 시간 ::: "+list.get(i).getAccureMonth());
			System.out.println();
			
		}
		
		//화이팅!
		mv.addObject("list", list);
		mv.addObject("listCount", listCount);
		mv.setViewName("commute/workingHourView");
		
		return mv;
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
			
			if(commuteTime <= realTime && checkLate == 0) {
				commute.setWorkStatus("Y");
			}else if(checkLate == 1 && commuteTime > realTime ){
				commute.setWorkStatus("L");
			}else {
				commute.setWorkStatus("E");
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
