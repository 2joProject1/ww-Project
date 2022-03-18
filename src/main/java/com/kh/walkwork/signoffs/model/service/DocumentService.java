package com.kh.walkwork.signoffs.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.community.model.dao.CommunityDao;
import com.kh.walkwork.signoffs.model.dao.DocumentDao;
import com.kh.walkwork.signoffs.model.dao.SignoffsDao;
import com.kh.walkwork.signoffs.model.vo.Document;

@Service
public class DocumentService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DocumentDao documentDao;
	
	public int insertDocument(Document d) {
		return documentDao.insertDocument(sqlSession, d);
	}

	public String getLastDocuNo() {
		return documentDao.getLastDocuNo(sqlSession);
	}
	
}
