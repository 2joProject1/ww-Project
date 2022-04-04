package com.kh.walkwork.schedule.model.service;

import java.util.ArrayList;

import com.kh.walkwork.schedule.model.vo.Schedule;

public interface ScheduleService {

//	ArrayList<Schedule> mainScheduleList(String memberNo);
	
	ArrayList<Schedule> selectScheduleList(String memberNo);
	
	int insertSchedule(Schedule schedule);

	int deleteSchedule(String no);

	int updateSchedule(Schedule sc);
}
