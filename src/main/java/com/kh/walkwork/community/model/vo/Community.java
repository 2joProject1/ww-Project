package com.kh.walkwork.community.model.vo;

import java.util.Date;

import lombok.Data;


@Data
public class Community {

	
	private int boardNo;
	private String boardWriter;
	private int projectNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Date enrollDate;
	private int count;
	private String status;
	private String topFix;
	private String noticeRange;
	private String noticeCategory;
	private String noticePeriod;
	private int communityGood;
	private String taskModifyDate;
	private int taskStatus;
	private String taskHandler;
	

}
