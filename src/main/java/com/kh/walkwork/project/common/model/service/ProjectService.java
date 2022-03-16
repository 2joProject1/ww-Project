package com.kh.walkwork.project.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.project.common.model.dao.ProjectDao;

@Service
public class ProjectService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProjectDao projectDao;
}
