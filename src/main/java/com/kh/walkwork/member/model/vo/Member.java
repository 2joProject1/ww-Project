package com.kh.walkwork.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor

public class Member {

	private String memberNo;
	private String deptNo;
	private String deptName;
	private String rankNo;
	private String memberName;
	private String memberPwd;
	private String birth;
	private String address;
	private String email;
	private String phone;
	private String telephone;
	private String status;
	private String file;
	private String filePath;
	private String loginFail;
	private String tmpPwd;
	private Date enrollDate;
	private String resignDate;

}
