package com.kh.walkwork.ogChart.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Setter
@Getter
@ToString
public class OgChart {

	private String memberNo;//MEMBER_NO
	private int deptNo;//DEPT_NO
	private int rankNo;//RANK_NO
	private String memberName;//MEMBER_NAME
	private String email;//EMAIL
	private String phone;//PHONE
	private String telephone;//TELEPHONE
	private String status;//STATUS
	private String file;//FILE
	private String filepath;//FILEPATH
	private Date enrollDate;//ENROLL_DATE
	private String resignDate;//RESIGN_DATE
}
