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

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("attachmentMapper.insertAttachment", a);
	}
	
	public List<Attachment> selectAttachmentList(Attachment a) {
		return sqlSession.selectList("attachmentMapper.selectAttachmentList", a);
	}
}
