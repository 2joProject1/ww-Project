package com.kh.walkwork.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.Attachment;

@Repository
public class AttachmentDao {
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("attachmentMapper.insertAttachment", a);
	}
}
