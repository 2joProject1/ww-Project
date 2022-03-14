package com.kh.walkwork.dayOff.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
public class DayOff {

	private int offNo;
	private int offDept; 
	private String offWriter;
	private String offStart; //OFF_START	DATE
	private String offEnd; //OFF_END	DATE
	private String offReason; //OFF_REASON	VARCHAR2(30 BYTE)
	private String requestDate; //REQUEST_DATE	DATE
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private int offDays; //OFF_DAYS	NUMBER
	private String memberName;
	private String deptName;
}
