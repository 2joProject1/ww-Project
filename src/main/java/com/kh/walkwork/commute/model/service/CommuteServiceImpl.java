package com.kh.walkwork.commute.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.commute.model.dao.CommuteDao;

@Service
public class CommuteServiceImpl implements CommuteService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDao commuteDao;
	
	
	
}
