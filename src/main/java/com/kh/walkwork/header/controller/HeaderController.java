package com.kh.walkwork.header.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.walkwork.chat.model.vo.Chat;
import com.kh.walkwork.chatMember.model.service.ChatMemberService;
import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Member;

@Controller
public class HeaderController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ChatMemberService chatMemberService;
	
	// 유저리스트 ajax로 뿌리기
	@ResponseBody
	@RequestMapping("addrList")
	public ArrayList<Member> selectAddrList(HttpSession session){
		
		// 나 빼고 불러올거임~~
		String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<Member> addrList = memberService.selectAddrList(memberNo);
		
//		System.out.println("연락처 리스트 : " + addrList);
		
		return addrList;
	}
	
	// 채팅리스트 ajax로 뿌리기
	@ResponseBody
	@RequestMapping("chatList")
	public ArrayList<Chat> selectMyChatList(HttpSession session){
		
		String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		ArrayList<Chat> chatList = chatMemberService.selectMyChatList(memberNo);
		
		System.out.println(chatList);
		
		return chatList;
	}

}
