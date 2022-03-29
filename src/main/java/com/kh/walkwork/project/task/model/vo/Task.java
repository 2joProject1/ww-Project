package com.kh.walkwork.project.task.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Task {
	private int boardNo;
	private String boardWriter;
	private int projectNo;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private Date boardReportDate;
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
	private Date taskEndDate;
	private int taskFilter1;
	private int taskFilter2;
	
	private String taskHandlerName;
	
}
