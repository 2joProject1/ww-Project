package com.kh.walkwork.commute.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
public class Commute {
	
	private String memberNo; //MEMBER_NO	VARCHAR2(20 BYTE)
	private String commuteStart; //COMMUTE_START	VARCHAR2(10 BYTE)
	private String coummteEnd; //COMMUTE_END	VARCHAR2(10 BYTE)
	private String commuteStatus; //COMMUTE_STATUS	VARCHAR2(1 BYTE)
	private String workStatus; //WORK_STATUS	VARCHAR2(1 BYTE)
	private Date commuteDate; //COMMUTE_DATE	DATE

}
