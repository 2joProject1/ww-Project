package com.kh.walkwork.chatMember.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

/*
MEMBER_NO	VARCHAR2(20 BYTE)
CHAT_NO	NUMBER
CREATE_CHAT	VARCHAR2(1 BYTE)
START_DATE	DATE
END_DATE	DATE
*/

@Data
@Component
public class ChatMember {
	private String memberNo;
	private int chatNo;
	private String createChat;
	private Date startDate;
	private Date endDate;
	
	
	private String memberCount;
	private String chatName;
	private String chatContent;

}
