package com.kh.walkwork.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.member.model.vo.Cert;
import com.kh.walkwork.member.model.vo.Member;

@Repository
public class MemberDao {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public void insertVeriCode(SqlSessionTemplate sqlSession, Cert cert) {
		sqlSession.insert("memberMapper.regist", cert);
	}

	public int valiCheck(SqlSessionTemplate sqlSession, Cert cert) {
		
		int result = sqlSession.selectOne("memberMapper.emailValidate", cert);
		
		if(result>0) {
			sqlSession.delete("memberMapper.emailValidateRemove", cert);
		}
		return result;
	}

	public int emailDuplicationCheck(SqlSessionTemplate sqlSession, String emailDupl) {
		
		return sqlSession.selectOne("memberMapper.emailDuplicationCheck", emailDupl);
	}

	public int idDuplicationCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.idDuplicationCheck", id);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public Member searchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId", m);
	}

	//----------------헤더----------------
	public ArrayList<Member> selectAddrList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAddrList");
	}

	// 윤희
	public Member selectMemberInformation(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMemberInformation", m);
	}
}
