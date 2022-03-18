package com.kh.walkwork.project.task.model.vo;

import lombok.Data;

@Data
public class Task {
	private int taskNo;
	private int type;
	private String taskDept;
	private String taskWriter;
	private String taskHandler;
	private int count;
	private int replyCount;
	private String taskTitle;
	private String taskContent;
	private String enrollDate;
	private String modifyDate;
	private int taskStatus;
}
