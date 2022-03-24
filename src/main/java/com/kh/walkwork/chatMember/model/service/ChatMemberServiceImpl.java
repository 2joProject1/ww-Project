package com.kh.walkwork.chatMember.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.chatMember.model.dao.ChatMemberDao;

@Service
public class ChatMemberServiceImpl implements ChatMemberService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChatMemberDao chatMemberDao;

	@Override
	public ArrayList<String> searchChatNo(HashMap map) {
		
		return chatMemberDao.searchChatNo(sqlSession, map);
	}

	@Override
	public int insertChatMember(HashMap<String, Object> map) {
		return chatMemberDao.insertChatMember(sqlSession, map);
	}

}
