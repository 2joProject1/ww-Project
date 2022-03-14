package com.kh.walkwork.dayOff.model.service;

import java.util.ArrayList;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.dayOff.model.vo.DayOff;

public interface DayOffService {
	
	// 일반사원
	int insertOff(DayOff off); // 휴가신청
	
	ArrayList<DayOff> selectListOff(String offWriter, PageInfo pi); // 사용자의 휴가 신청리스트 전체조회
	
	ArrayList<DayOff> searchListOff(DayOff off, PageInfo pi);  // 사용자의 휴가 기간검색
	
	int selectCountOff(String offWriter); // 해당되는 사용자의 휴가 리스트카운트 몇개등록했나
	
	int searchCountOff(DayOff off);
	
	//관리자
	int approval(int offNo); // 휴가 승인,반려
	
	ArrayList<DayOff> adminSelectListOff(PageInfo pi); // 휴가자들 신청리스트 전체조회
	
	ArrayList<DayOff> adminSearchListOff(DayOff off, PageInfo pi); // 휴가자 휴가 기간검색

	int adminSelectCountOff();
	
	int adminSearchCountOff(DayOff off);
}
