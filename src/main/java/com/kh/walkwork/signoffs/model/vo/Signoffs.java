package com.kh.walkwork.signoffs.model.vo;

import lombok.Data;

@Data
public class Signoffs {
	private int approvalNo;
	private String approvaler;
	private String docuNo;
	private String docuDate;
	private String approvalDate;
	private String approvalRejectDate;
	private String approvalStatus;
	private String approvalDecision;
	private String approvalRank;
	private String approvalReject;
}