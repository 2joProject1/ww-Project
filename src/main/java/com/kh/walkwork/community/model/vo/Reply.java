package com.kh.walkwork.community.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	private int replyNo;
	private int boardNo;
	private String memberNo;
	private String replyContent;
	private Date enrollDate;
}
