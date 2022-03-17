package com.kh.walkwork.signoffs.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.signoffs.model.vo.Document;

@Repository
public class DocumentDao {
	public int insertDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertDocument", d);
	}

	public String getLastDocuNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("documentMapper.getLastDocuNo");
	}
}
