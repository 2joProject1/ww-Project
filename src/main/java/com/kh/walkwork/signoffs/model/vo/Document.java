package com.kh.walkwork.signoffs.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Document {
	private String docuNo; // 문서번호
	private String drafter; // 세션에서 추출 (기안자 사원번호)
	private String docuFormat; // 화면 넘어오는 문서유형
	private String docuTitle;
	private String docuContent;
	private String docuRetentionPeriod;
	private String approvalDecision;
	private Date docuWriteDate;
	
	
	
	private String signoffs; // 결재 요청자 명단 (콤마 구분해서 들어옴)
	private String signoffsDeptNo;
	
	private int selectType; // select유형 (receive: 수신문서함)
	private String approver;
	private int approvalNo;
	
	private String docuWriteStartDate;
	private String docuWriteEndDate;
	private String fileYn;
}