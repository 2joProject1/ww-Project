package com.kh.walkwork.chatContent.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.chatContent.model.vo.ChatContent;

@Repository
public class ChatContentDao {

	public ArrayList<ChatContent> selectOtherChatContent(SqlSession sqlSession, String chatNo) {
		return (ArrayList)sqlSession.selectList("chatContentMapper.selectOtherChatContent", chatNo);
	}

	public int insertChatContent(SqlSession sqlSession, ChatContent chatContent) {
		return sqlSession.insert("chatContentMapper.insertChatContent", chatContent);
	}

}
