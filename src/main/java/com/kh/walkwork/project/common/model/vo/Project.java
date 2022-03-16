package com.kh.walkwork.project.common.model.vo;

import lombok.Data;

@Data
public class Project {
	private int projectNo;
	private String projectWriter;
	private String projectTitle;
	private String projectSummary;
	private String projectStartDate;
	private String projectEndDate;
	private String projectStatus;
	private String projectPercent;
}
