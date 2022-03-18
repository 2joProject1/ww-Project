package com.kh.walkwork.project.task.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TaskService taskService;
}
