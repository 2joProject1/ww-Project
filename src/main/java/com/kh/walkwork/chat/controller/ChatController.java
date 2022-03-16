package com.kh.walkwork.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	@RequestMapping(value="chattingRoom", method=RequestMethod.GET)
	public String enterChatting() {
		return "common/chattingRoom";
	}

}
