package com.kh.walkwork.todo.model.vo;

import java.util.Date;

import com.kh.walkwork.member.model.vo.Cert;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor

public class Todo {
	public int boardNo;
	public String memberNo;
	public String content;
	public String check;
}
