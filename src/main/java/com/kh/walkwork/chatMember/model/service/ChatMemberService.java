package com.kh.walkwork.chatMember.model.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface ChatMemberService {
	
	// 채팅넘버리스트 가져오는 메소드
	ArrayList<String> searchChatNo(HashMap<String, Object> map);

	// 채팅방 멤버 추가
	int insertChatMember(HashMap<String, Object> map);
	

}
