package com.kh.walkwork.member.model.service;

import java.util.ArrayList;

import com.kh.walkwork.member.model.vo.Cert;
import com.kh.walkwork.member.model.vo.Member;

public interface MemberService {

	//회원가입
	int insertMember(Member m);
	
	String sendMail(String ip);
	
	int valiCheck(Cert cert);
	
	int emailDuplicationCheck(String emailDupl);
	
	int idDuplicationCheck(String id);
	
	
	//로그인
	Member loginMember(Member m);

	Member searchId(Member m);
	

	// 헤더
	ArrayList<Member> selectAddrList(String memberNo);

	// ---윤희
	public Member selectMemberInformation(Member m);

	
}
