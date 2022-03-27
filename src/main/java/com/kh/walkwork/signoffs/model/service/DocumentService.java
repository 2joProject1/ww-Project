package com.kh.walkwork.signoffs.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.PageInfo;
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
	
	public List<Document> getDocumentList(Document d, PageInfo pi) {
		return documentDao.getDocumentList(sqlSession, d, pi);
	}

	public Document getDocumentOne(Document d) {
		return documentDao.getDocumentOne(sqlSession, d);
	}

	public int selectDocumentCount(Document d) {
		return documentDao.selectDocumentCount(sqlSession, d);
	}

	public int updateDocument(Document d) {
		return documentDao.updateDocument(sqlSession, d);
	}

	public int deleteDocument(Document d) {
		return documentDao.deleteDocument(sqlSession, d);
	}
	
}
