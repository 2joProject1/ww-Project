package com.kh.walkwork.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Cert {
	private String ipInfo;
	private String veriCode; 
	private Date certTime;
}
