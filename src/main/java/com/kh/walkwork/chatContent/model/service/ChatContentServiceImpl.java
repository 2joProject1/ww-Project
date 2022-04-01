package com.kh.walkwork.chatContent.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.chatContent.model.dao.ChatContentDao;
import com.kh.walkwork.chatContent.model.vo.ChatContent;

@Service
public class ChatContentServiceImpl implements ChatContentService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChatContentDao chatContentDao;

	@Override
	public ArrayList<ChatContent> selectOtherChatContent(String chatNo) {
		return chatContentDao.selectOtherChatContent(sqlSession, chatNo);
	}

	@Override
	public int insertChatContent(ChatContent chatContent) {
		return chatContentDao.insertChatContent(sqlSession, chatContent);
	}

}
