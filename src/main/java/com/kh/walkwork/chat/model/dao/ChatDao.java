package com.kh.walkwork.chat.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {

	public int insertChat(SqlSession sqlSession, String chatName) {
		return sqlSession.insert("chatMapper.insertChat", chatName);
	}

	public String selectChatNo(SqlSession sqlSession) {
		return sqlSession.selectOne("chatMapper.selectChatNo");
	}

	public String selectChatName(SqlSession sqlSession, String chatNo) {
		return sqlSession.selectOne("chatMapper.selectChatName", chatNo);
	}

}
