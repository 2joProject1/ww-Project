package com.kh.walkwork.signoffs.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.walkwork.signoffs.model.dao.SignoffsDao;

public class SignoffsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SignoffsDao signoffsDao;
}
