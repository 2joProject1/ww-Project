package com.kh.walkwork.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Schedule {
	private int boardNo;
	private String memberNo;
	private String startDate;
	private String endDate;
	private String place;
	private String title;
	private String content;

}
