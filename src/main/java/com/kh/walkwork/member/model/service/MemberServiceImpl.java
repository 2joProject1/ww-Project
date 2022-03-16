package com.kh.walkwork.member.model.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.member.model.dao.MemberDao;
import com.kh.walkwork.member.model.vo.Cert;
import com.kh.walkwork.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public Member loginMember(Member m) {
		return null;
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



}
