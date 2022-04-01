package com.kh.walkwork.chat.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.chat.model.dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChatDao chatDao;
	
	// 1:1 채팅방 추가하고 chatNo 알아오기
	@Override
	public String insertChat(String chatName) {
		int result = chatDao.insertChat(sqlSession, chatName);
		System.out.println("채팅 추가 result : " + result);
		String chatNo = chatDao.selectChatNo(sqlSession);
		
		System.out.println(chatNo);
		return chatNo;
	}
	
	// 채팅방 번호 가져오기
	@Override
	public String selectChatNo() {
		return chatDao.selectChatNo(sqlSession);
	}

	@Override
	public String selectChatName(String chatNo) {
		return chatDao.selectChatName(sqlSession, chatNo);
	}
	

}
