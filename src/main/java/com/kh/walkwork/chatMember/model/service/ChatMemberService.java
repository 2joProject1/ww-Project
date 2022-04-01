package com.kh.walkwork.chatMember.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.walkwork.chat.model.vo.Chat;

public interface ChatMemberService {
	
	// 채팅넘버리스트 가져오는 메소드
	ArrayList<String> searchChatNo(HashMap<String, Object> map);

	// 채팅방 멤버 추가
	int insertChatMember(HashMap<String, Object> map);

	// 채팅방 멤버 수 조회
	int selectChatMemberCount(String a);

	// 채팅방 멤버 리스트
	ArrayList<String> selectChatMemberList(String chatNo);
	
	// 내가 속한 채팅 리스트
	ArrayList<Chat> selectMyChatList(String memberNo);
	

}
