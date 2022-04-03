package com.kh.walkwork.todo.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor

public class Todo {
//	public int boardNo;
//	public String memberNo;
//	public String content;
//	public String check;
	
	private int todoNo;
	private String memberNo;
	private String content;
	private String status;
	private String startDate;
	private String endDate;
}
