package com.kh.walkwork.notice.model.vo;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Notice {
	private int boardNo;
	private String boardWriter;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private Date EnrollDate;
	private int count;
	private String Status;
	private String topFix;
	private String noticeRange;
	private String noticeCategory;
	private String noticePeriod;
	private String memberName;
	
	
// 파일관련
	
	private String fileName;
	private String fileOriginName;
	private String filePath;
	private String fileSize;
	private Date fileUploadDate;


}
