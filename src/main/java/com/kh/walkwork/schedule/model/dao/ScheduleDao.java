package com.kh.walkwork.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {

	public ArrayList<Schedule> mainScheduleList(SqlSessionTemplate sqlSession, String memberNo) {
		
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.mainScheduleList", memberNo);
	}

}
