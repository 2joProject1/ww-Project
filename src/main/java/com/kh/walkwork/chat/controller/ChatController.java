package com.kh.walkwork.chat.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.walkwork.chat.model.service.ChatService;
import com.kh.walkwork.chatContent.model.service.ChatContentService;
import com.kh.walkwork.chatContent.model.vo.ChatContent;
import com.kh.walkwork.chatMember.model.service.ChatMemberService;
import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Member;

@Controller
@RequestMapping(value="chat")
public class ChatController {
	
	@Autowired
	private ChatMemberService chatMemberService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ChatContentService chatContentService;
	
	@Autowired
	private MemberService memberService;
	
	// 해당 chatno 로 입장
	@SuppressWarnings("null")
	@RequestMapping(value="chatRoom", method=RequestMethod.GET)
	public String myChatAdd(String chatMemberNo, String chatMemberName, HttpSession session, RedirectAttributes redirectAttributes) {
		
		Member m = (Member)session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberNo", m.getMemberNo());
		map.put("memberName", m.getMemberName());
		map.put("createChat", 1);
		map.put("chatMemberNo", chatMemberNo);
		map.put("chatMemberName", chatMemberName);
		
		System.out.println(map);
		
		String chatName = m.getMemberName() + "," + chatMemberName;
		map.put("chatName", chatName);
		
		ArrayList<String> chatNoList = new ArrayList<String>();
		chatNoList = chatMemberService.searchChatNo(map);
		System.out.println("채팅방 번호 리스트  \n" + chatNoList);
		
		// 채팅방 인원 수 체크 count
		int count = 0;
		
		if(!chatNoList.isEmpty()) {
			// 채팅방이 있을 때
			String chatNo = null;
			for(String a : chatNoList) {
				count = chatMemberService.selectChatMemberCount(a);
				System.out.println("채팅방 멤버 수 : " + count);
				
				if(count == 2) {
					// 1:1 채팅방일 때
					chatNo = a;
					System.out.println("채팅방 번호 : " + a);
					redirectAttributes.addAttribute("chatNo", chatNo);
					
					return "redirect:/chat/chatRoomDetail";
					
				} else {
					// 1:1 채팅방이 없을 때
					chatNo = chatService.insertChat(chatName);
					System.out.println("1:1 채팅방 없을 때 새로 만든 chatNo : " + chatNo);
					map.put("chatNo", chatNo);
					int result = chatMemberService.insertChatMember(map);
					System.out.println("채팅멤버(나) 추가 : " + result);
					redirectAttributes.addFlashAttribute("map", map);
					
					return "redirect:chat/otherChatAdd";
					
				}
				
			}
			return "gd";
					
		} else {
			// 채팅방이 아예 없을 때
			String chatNo = chatService.insertChat(chatName);
			System.out.println("새로 생긴 채팅방 번호 : " + chatNo);
			map.put("chatNo", chatNo);
			
			// 채팅 멤버 추가
			int result = chatMemberService.insertChatMember(map);
			System.out.println("채팅멤버(나) 추가 : " + result);
			redirectAttributes.addFlashAttribute("map", map);
			return "redirect:/chat/otherChatAdd";
			
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("otherChatAdd")
	public ModelAndView otherChatAdd(@RequestParam HashMap<String, Object> map, HttpServletRequest request, RedirectAttributes redirectAttributes, ModelAndView mv) {
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			map = (HashMap<String, Object>) flashMap.get("map");
		}
		map.put("memberNo", map.get("chatMemberNo"));
		map.put("createChat", 0);
		// memberNo, createChat 넘겨서 insert하고 chatName 보내기
		System.out.println(map);
		
		int result = chatMemberService.insertChatMember(map);
		System.out.println("채팅멤버(상대방) 추가 : " + result);
		
		mv.addObject("chatName", map.get("chatName"));
		mv.addObject("chatNo", map.get("chatNo"));
		mv.setViewName("common/chatRoom");
		return mv;
	}
	
	@SuppressWarnings("null")
	@RequestMapping("chatRoomDetail")
	public ModelAndView chatRoomDetail(@RequestParam(name = "chatNo") String chatNo, HttpSession session, ModelAndView mv) {
		
		System.out.println(chatNo);
		Member m = (Member)session.getAttribute("loginUser");
		String memberNo = m.getMemberNo();
		
		ArrayList<ChatContent> myList = null;
		ArrayList<ChatContent> conList = null;
		ArrayList<String> chatMemberList = null;
		String chatName = null;
		String formatDate = null;
		
		try {
			conList = chatContentService.selectOtherChatContent(chatNo);
			System.out.println("내용 list : " + conList);
			
			for(int i=0; i<conList.size(); i++) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				formatDate = format.format(conList.get(i).getChatDate());
				conList.get(i).setFormatDate(formatDate);
			}
			
			chatName = chatService.selectChatName(chatNo);
			System.out.println("채팅방 이름 : " + chatName);
			
			chatMemberList = chatMemberService.selectChatMemberList(chatNo);
			System.out.println("채팅방 멤버 리스트 : " + chatMemberList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("chatNo", chatNo);
		mv.addObject("chatName", chatName);
		mv.addObject("chatMemberList", chatMemberList);
		mv.addObject("memberNo", memberNo);
		mv.addObject("conList", conList);
		mv.setViewName("common/chatRoom");
		
		
		return mv;
	}
	
	// ajax
	@ResponseBody
	@RequestMapping(value = "contentAdd", produces="text/html; charset=UTF-8")
	public String insertChatContent(String message, String chatNo, String memberNo, ChatContent chatContent) throws IOException {
		
		// memberNo => 메세지를 보낸 사람
		chatContent.setMemberNo(memberNo);
		chatContent.setChatContent(message);
		chatContent.setChatNo(chatNo);
		
		System.out.println(chatContent);
		
		int result = chatContentService.insertChatContent(chatContent);
		System.out.println("새로운 chat 추가 : " + result);
		
		return "ajax 성공";
	}
	
	@RequestMapping("chatInvite")
	public ModelAndView chatInvite(ModelAndView mv, HttpSession session) {
		
		String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		ArrayList<Member> list = null;
		
		list = memberService.selectAddrList(memberNo);
		
		System.out.println(list);
		
		mv.addObject("list", list);
		mv.setViewName("common/chatInvite");
		
		return mv;
	}
	
	@RequestMapping("chatInviteAdd")
	public ModelAndView chatInviteAdd(@RequestParam(value="memberNo") ArrayList<String> chatMemberNo, @RequestParam(value="memberName") ArrayList<String> chatMemberName, ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String memberNo = m.getMemberNo();
		String memberName = m.getMemberName();
		
		int memberCount = chatMemberNo.size() + 1;
		String chatName = "그룹채팅(" + memberCount + ")";
		String chatNo = null;
		
		System.out.println("memberNo : " + chatMemberNo);
		System.out.println("memberName : " + chatMemberName);
		
		chatNo = chatService.insertChat(chatName);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("createChat", 1);
		map.put("chatNo", chatNo);
		
		// 만든 사람 채팅방 멤버 추가 (나)
		int result = chatMemberService.insertChatMember(map);
		System.out.println("채팅방 만든 사람 멤버 추가 : " + result);
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		int otherResult = 0;
		
		
		for(String a : chatMemberNo) {
			map.replace("memberNo", a);
			map.replace("createChat", 0);
			
			System.out.println(map);
			
			otherResult += chatMemberService.insertChatMember(map);
			
		}
		System.out.println("그룹 채팅 추가 멤버 수 : " + otherResult);
		
		mv.addObject("chatNo", chatNo);
		mv.setViewName("redirect:/chat/chatRoomDetail");
		
		return mv;
	}

}
