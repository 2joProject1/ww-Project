package com.kh.walkwork.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Component
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

	
	public Member(String memberNo,  String memberName, String memberPwd, String email,String rankNo, String status) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberPwd = memberPwd;
		this.email = email;
		this.rankNo = rankNo;
		this.status = status;
	}
}
