package com.kh.walkwork.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.Attachment;

@Repository
public class AttachmentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
  
  //주현: 첨부파일 삽입
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("attachmentMapper.insertAttachment", a);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("attachmentMapper.insertFile", a);
	}
	
	public int insertNoticeAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("attachmentMapper.insertNoticeFile", a);
	}
	
  //주현 : 첨부파일 리스트 
	public List<Attachment> selectAttachmentList(Attachment a) {
		return sqlSession.selectList("attachmentMapper.selectAttachmentList", a);
	}

	public Object removeAttachment(String fileName) {
		return sqlSession.insert("attachmentMapper.removeAttachment", fileName);
	}
}
