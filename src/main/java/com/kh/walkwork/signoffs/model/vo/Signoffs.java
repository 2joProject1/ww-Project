package com.kh.walkwork.signoffs.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Signoffs {
	private int approvalNo;
	private String approver;
	private String docuNo;
	private String docuDate;
	private Date approvalDate;
	private Date approvalRejectDate;
	private int approvalStatus; // (0:대기, 1:승인, 2:반려)
	private String approvalRank;
	private String approvalReject;

	// Member 테이블
	private String memberName;
}