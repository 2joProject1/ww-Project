package com.kh.walkwork.member.model.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.member.model.dao.MemberDao;
import com.kh.walkwork.member.model.vo.Cert;
import com.kh.walkwork.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

//	랜덤값 생성
	public String generateVeriCode() {
		Random r = new Random();
		int n = r.nextInt(100000);
		Format f = new DecimalFormat("000000");
		String VeriCode = f.format(n);

		return VeriCode;

	}

	@Override
	public String sendMail(String ip) {
		String veriCode = this.generateVeriCode();
		Cert certVo = Cert.builder().ipInfo(ip).veriCode(veriCode).build();
		memberDao.insertVeriCode(sqlSession, certVo);
		return veriCode;
	}

	@Override
	public int valiCheck(Cert cert) {

		return memberDao.valiCheck(sqlSession, cert);
	}

	@Override
	public int emailDuplicationCheck(String emailDupl) {

		return memberDao.emailDuplicationCheck(sqlSession, emailDupl);
	}

	@Override
	public int idDuplicationCheck(String id) {

		return memberDao.idDuplicationCheck(sqlSession, id);
	}

	// ---------------------로그인---------------------------

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	// ------------헤더--------------
	@Override
	public ArrayList<Member> selectAddrList() {
		return memberDao.selectAddrList(sqlSession);
	}

	@Override
	public Member searchId(Member m) {
		return null;
	}
	//------------헤더--------------

	@Override
	public Member searchId(Member m) {
		return memberDao.searchId(sqlSession, m);
	}

	@Override
	public int updateMemberFile(Member m) {
		return memberDao.updateMemberFile(sqlSession, m);
	}

	@Override
	public int changePwd(Member m) {
		return memberDao.changePwd(sqlSession, m);
	}

	// 윤희- 회원조회
	@Override
	public Member selectMemberInformation(Member m) {
		return memberDao.selectMemberInformation(sqlSession, m);
	

	
	
	//---------------------조직도 ---------------------------
	
	public int listCountFirst(String cno) {
		return memberDao.listCountFirst(cno);
	}
	public List<Member> selectOgFirst(int startPage, int limit, String cno) { 
		return memberDao.selectOgFirst(startPage, limit, cno);
	}
		public int listCount(HashMap<String, String> paramMap) {
		return memberDao.listCount(paramMap);
	}
	public List<Member> selectOgUser(int startPage, int limit, HashMap<String, String> paramMap) {
		return memberDao.selectOrgani(startPage, limit, paramMap);
	}
	public int updateDept(Member m) {  
		return memberDao.updateDept(m);
	}
	public List<Member> deleteOgUser(HashMap<String, String> paramMap1) {
	List<Member> deleteList = memberDao.deleteOrgani(paramMap1);
		return deleteList;
		
	}

}
