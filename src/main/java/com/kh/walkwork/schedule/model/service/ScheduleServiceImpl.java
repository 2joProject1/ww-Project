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


	@Override
	public ArrayList<Schedule> mainScheduleList(String memberNo) {
		return scheduleDao.mainScheduleList(sqlSession, memberNo);
	}
}
