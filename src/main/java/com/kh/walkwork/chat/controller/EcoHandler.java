package com.kh.walkwork.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.walkwork.member.model.service.MemberService;

public class EcoHandler extends TextWebSocketHandler{
	
//	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();
	
	@Autowired
	private MemberService memberSerivce;
	
	ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		users.add(session);
//		System.out.println("사용자 접속 : 현재 " + users.size() + "명");
		
		boolean flag = false;
		System.out.println(session);
		
		String url = session.getUri().toString();
		System.out.println(url);
		
		String chatNo = url.split("chatNo=")[1];
		System.out.println(chatNo);
		
		int idx = list.size();
		
		System.out.println("idx : " + idx);
		
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				String chatNo2 = (String) list.get(i).get("chatNo");
				if(chatNo2.equals(chatNo)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { // 존재하는 채팅방일 경우
			HashMap<String, Object> map = list.get(idx);
			map.put(session.getId(), session);
			list.add(map);
			
		} else { // 최초 생성하는 방이라면
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("chatNo", chatNo);
			map.put(session.getId(), session);
			list.add(map);
		}
		
		System.out.println("참여자 list : " + list);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 메세지를 모든 사용자에게 전송(사용자 수만큼 반복하여 전송)
		
		TextMessage newMessage = new TextMessage(message.getPayload());
//		session.sendMessage(newMessage); // 메세지를 발신한 사람에게 다시 메세지를 보냄
		
//		for(WebSocketSession ws : users) {
//			ws.sendMessage(newMessage);
//		}
		
		System.out.println(message.getPayload());
		String strs[] = message.getPayload().split(",");
		String chatNo = strs[0];
		System.out.println("메세지 chatNo : " + chatNo);
		String msg = strs[1];
		String memberName = strs[strs.length - 1];
		
		System.out.println("msg : " + msg);
		System.out.println("memberName : " + memberName);
		
		HashMap<String, Object> temp = new HashMap<String, Object>();
		
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				String chatNo2 = (String)list.get(i).get("chatNo");
				if(chatNo2.equals(chatNo)) {
					temp = list.get(i);
					break;
				}
			}
			for(String k : temp.keySet()) {
				if(k.equals("chatNo")) {
					continue;
				}
				WebSocketSession ws = (WebSocketSession) temp.get(k);
				if(ws != null) {
					ws.sendMessage(new TextMessage(memberName + "|" + msg));
				}
			}
		}
		
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		users.remove(session);
//		System.out.println("사용자 종료 : 현재  " + users.size() + "명");
		
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				list.get(i).remove(session.getId());
			}
		}
		
		System.out.println(session.getId() + " 연결 끊김 echo");
		System.out.println(list.size() + " : list.size()");
	}

}
