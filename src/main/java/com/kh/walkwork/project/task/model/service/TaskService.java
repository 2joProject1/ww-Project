package com.kh.walkwork.project.task.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.project.task.model.dao.TaskDao;
import com.kh.walkwork.project.task.model.vo.Task;

@Service
public class TaskService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TaskDao taskDao;
	
	public int insertTask(Task t) {
		return taskDao.insertTask(sqlSession, t);
	}
	
	
	
}
