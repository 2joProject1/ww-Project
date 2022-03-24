package com.kh.walkwork.signoffs.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.signoffs.model.vo.Document;

@Repository
public class DocumentDao {
	public int insertDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertDocument", d);
	}

	public String getLastDocuNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("documentMapper.getLastDocuNo");
	}
	public List<Document> getDocumentList(SqlSessionTemplate sqlSession, Document d, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("documentMapper.getDocumentList", d, rowBounds);
	}

	public Document getDocumentOne(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("documentMapper.getDocumentOne", d);
	}

	public int selectDocumentCount(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.selectOne("documentMapper.selectDocumentCount", d);
	}

	public int updateDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("documentMapper.updateDocument", d);
	}

	public int deleteDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.delete("documentMapper.deleteDocument", d);
	}
}
