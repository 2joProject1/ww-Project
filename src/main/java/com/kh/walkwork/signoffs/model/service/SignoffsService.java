package com.kh.walkwork.signoffs.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.community.model.dao.CommunityDao;
import com.kh.walkwork.signoffs.model.dao.SignoffsDao;

@Service
public class SignoffsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SignoffsDao signoffsDao;
	
	
}
