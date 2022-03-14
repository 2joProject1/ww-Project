package com.kh.walkwork.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {

	private String memberNo;
	private String memberName;
	private String memberPwd;
	private String birth;
	private String address;
	private String email;
	private String phone;
	private String mStatus;
	private String mFile;
	private String mFilePath;
	private String telephone;
	private String loginFail;
	private String tmpPwd;
	private String enrollDate;
	private String resignDate;
	
}
