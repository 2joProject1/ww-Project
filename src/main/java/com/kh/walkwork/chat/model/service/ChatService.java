package com.kh.walkwork.chat.model.service;

import java.util.ArrayList;

public interface ChatService {
	
	// 1:1 채팅방 만들기
	String insertChat(String chatName);
	
	// 채팅방 번호 가져오기
	String selectChatNo();

}
