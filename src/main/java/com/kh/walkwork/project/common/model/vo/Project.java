package com.kh.walkwork.project.common.model.vo;

import lombok.Data;

@Data
public class Project {
	private int projectNo;
	private String projectWriter;
	private String projectTitle;
	private String projectMemberNo;
	private String projectSummary;
	private String projectStartDate;
	private String projectEndDate;
	private String projectStatus; // 0:완료, 1:진행
	private String projectPercent;
	
	private String projectMemberStr;
	private int projectMemberCount;
}
