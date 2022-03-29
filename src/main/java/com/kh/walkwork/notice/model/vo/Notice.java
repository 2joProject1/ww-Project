package com.kh.walkwork.notice.model.vo;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Notice {
	private int 	boardNo;
	private String 	boardWriter; // Author
	private String 	boardType;
	private String 	boardTitle;
	private String 	boardContent;
	
	private Date 	enrollDate;
	private int 	count;  // 조회수
	private String 	status; // 글 삭제의 상태 
	private String 	topFix; // 상단 고정
	private String 	noticeRange;
	private String 	noticeCategory;
	private String 	noticePeriod;
	private String 	memberName;
}
