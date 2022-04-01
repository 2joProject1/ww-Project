package com.kh.walkwork.chatContent.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

/*
CC_NO	NUMBER
CHAT_NO	NUMBER
MEMBER_NO	VARCHAR2(10 BYTE)
CHAT_DATE	DATE
CHAT_CONTENT	VARCHAR2(2000 BYTE)
CHAT_FIX	NUMBER
CHAT_IMG	VARCHAR2(500 BYTE)
CHAT_FILEPATH	VARCHAR2(500 BYTE)
*/

@Data
@Component
public class ChatContent {
	
	private int ccNo;
	private String chatNo;
	private String memberNo;
	private Date chatDate;
	private String chatContent;
	private int chatFix;
	private String chatImg;
	private String chatFilePath;
	private String formatDate;
	private String memberName;

}
