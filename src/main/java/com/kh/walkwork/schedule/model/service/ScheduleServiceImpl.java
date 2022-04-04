package com.kh.walkwork.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.schedule.model.dao.ScheduleDao;
import com.kh.walkwork.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
//
//
//	@Override
//	public ArrayList<Schedule> mainScheduleList(String memberNo) {
//		return scheduleDao.mainScheduleList(sqlSession, memberNo);
//	}
	
	@Override
	public ArrayList<Schedule> selectScheduleList(String memberNo) {
		return scheduleDao.selectScheduleList(sqlSession, memberNo);
	}
	
	@Override
	public int insertSchedule(Schedule schedule) {
		return scheduleDao.insertSchedule(sqlSession, schedule);
	}

	@Override
	public int deleteSchedule(String no) {
		return scheduleDao.deleteSchedule(sqlSession, no);
	}

	@Override
	public int updateSchedule(Schedule sc) {
		return scheduleDao.updateSchedule(sqlSession, sc);
	}
	
}
