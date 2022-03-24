package com.kh.walkwork.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.chat.model.service.ChatService;
import com.kh.walkwork.chatMember.model.service.ChatMemberService;
import com.kh.walkwork.member.model.vo.Member;

@Controller
@RequestMapping(value="chat")
public class ChatController {
	
	@Autowired
	private ChatMemberService chatMemberService;
	
	@Autowired
	private ChatService chatService;
	
	// 해당 chatno 로 입장
	@SuppressWarnings("null")
	@RequestMapping(value="chatRoom", method=RequestMethod.GET)
	public ModelAndView myChatAdd(String chatMemberNo, String chatMemberName, HttpSession session, ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberNo", m.getMemberNo());
		map.put("memberName", m.getMemberName());
		map.put("createChat", 1);
		map.put("chatMemberNo", chatMemberNo);
		map.put("chatMemberName", chatMemberName);
		
		System.out.println(map);
		
		String chatName = m.getMemberName() + "," + chatMemberName;
		
		ArrayList<String> chatNoList = new ArrayList<String>();
		chatNoList = chatMemberService.searchChatNo(map);
		System.out.println("채팅방 번호 리스트  \n" + chatNoList);
		
		// 채팅방 인원 수 체크 count
		int count = 0;
		
		if(!chatNoList.isEmpty()) {
			// 채팅방이 있을 때
			
		} else {
			// 채팅방이 아예 없을 때
			String chatNo = chatService.insertChat(chatName);
			System.out.println("새로 생긴 채팅방 번호 : " + chatNo);
			map.put("chatNo", chatNo);
			
			// 채팅 멤버 추가
			int result = chatMemberService.insertChatMember(map);
			System.out.println("채팅멤버(나) 추가 : " + result);
			mv.addObject("map", map);
			mv.setViewName("redirect:chat/otherchatadd");
		}
		
		return mv;
	}
	
	@RequestMapping("otherchatadd")
	public ModelAndView otherChatAdd(HashMap<String, Object> map, ModelAndView mv) {
		
		System.out.println(map);
		return mv;
	}

}
