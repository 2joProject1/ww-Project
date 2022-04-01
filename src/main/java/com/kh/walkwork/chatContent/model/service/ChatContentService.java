package com.kh.walkwork.chatContent.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.walkwork.chatContent.model.dao.ChatContentDao;
import com.kh.walkwork.chatContent.model.vo.ChatContent;

public interface ChatContentService {
	
	// 저장되어있는 chatContent 불러오기
	ArrayList<ChatContent> selectOtherChatContent(String chatNo);

	// 새로운 chatContent 추가
	int insertChatContent(ChatContent chatContent);

}
