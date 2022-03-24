package com.kh.walkwork.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	ArrayList<Member> selectAddrList();
	
	

	// ---윤희
	public Member selectMemberInformation(Member m);

	
	//---------------------조직도 ---------------------------
	public int listCountFirst(String cno);
	public List<Member> selectOgFirst(int startPage, int limit, String cno);
	public int listCount(HashMap<String, String> paramMap);
	public List<Member> selectOgUser(int startPage, int limit, HashMap<String, String> paramMap);
	public int updateDept(Member m); 
	public List<Member> deleteOgUser(HashMap<String, String> paramMap1);
	
}
