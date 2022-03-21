package com.kh.walkwork.chat.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Chat {
	
	private String chatNo;
	private String pno;
	private String chatName;
	private int mcount;
	private String chatCount;
	private String content;
	
}
