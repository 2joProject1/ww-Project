package com.kh.walkwork.commute.model.service;

import java.util.ArrayList;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.commute.model.vo.Commute;

public interface CommuteService {
	
	// 출근
	int insertCommute(Commute commute);
	
	// 퇴근
	int updateCommute(Commute commute);
	
	//해당사원조회
	ArrayList<Commute> selectListCommute(Commute commute, PageInfo pi);
	
	// 출근확인
	int checkCommute(Commute commute);
	
	// 퇴근확인
	int checkEnd(Commute commute);
	
	// 지각여부확인
	int checkLate(Commute commute);
	
	// 출퇴근조회
	int selectListCount(Commute commute);
	
	// 월 조회
	ArrayList<Commute> selectMonthList(Commute commute);
	
	int selectMonthCount(Commute commute);
	
	
	

}
