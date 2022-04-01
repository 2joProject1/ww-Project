package com.kh.walkwork.project.common.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProjectNotice {

	private int boardNo;
	private String boardWriter;
	private Date enrollDate;
	private String boardTitle;
	private String boardContent;
	private int count;
	private int boardType;
}
