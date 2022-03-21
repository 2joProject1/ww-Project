package com.kh.walkwork.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="chat")
public class ChatController {
	
	// 1:1 채팅방, chatMember 추가
	public ModelAndView myChatAdd(String chatNo, String chatName, ModelAndView mv) {
		
		
		
		return mv;
	}
	
	
	
	
	
	// 해당 chatno 로 입장
	@SuppressWarnings("null")
	@RequestMapping(value="chatRoomDetail", method=RequestMethod.GET)
	public String chatRoomDetail() {
		System.out.println("gd");
		return "common/chatRoomDetail";
	}

}
