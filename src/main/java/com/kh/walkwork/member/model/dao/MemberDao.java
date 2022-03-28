package com.kh.walkwork.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	public int loginFail(SqlSessionTemplate sqlSession, Member loginUser) {
		String memberNo = loginUser.getMemberNo();
		return sqlSession.update("memberMapper.loginFail", memberNo);
	}

	public int loginFailReset(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.loginFailReset", loginUser);
	}
	
	public int loginFailCount(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.selectOne("memberMapper.loginFailCount", loginUser);
	}
	
	public int sendPwd(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.sendPwd", m);
	}
	
	public int deleteTmpPwd(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.deleteTmpPwd", loginUser);
	}
	
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePwd", m);
	}
	
	
	public Member searchMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}
	
	//----------------헤더----------------
	public ArrayList<Member> selectAddrList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAddrList");
	}

	// ---- 윤희
	//멤버 정보 조회
	public Member selectMemberInformation(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMemberInformation", m);
	}

	//  멤버 정보 파일 업로드
	public int updateMemberFile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemberFile", m);
	}
	// 멤버 정보 비밀번호 변경
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePwd", m);
	}
	

	//----------------조직도----------------
	
	//미분류그룹
	
		@Autowired
		private SqlSession sqlSession;
		
				public int listCountFirst(String cno) {
					return sqlSession.selectOne("Member.listCountFirst", cno);
				}
				public List<Member> selectOgFirst(int startPage, int limit, String cno) { // 특정 페이지 단위의 게시글 조
					int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
					RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowbounds
					return sqlSession.selectList("Member.selectOgFirst",cno,row);
				}
				//분류그룹
				public int listCount(HashMap<String, String> paramMap) {
					return sqlSession.selectOne("Member.listCount", paramMap);
				}
				public List<Member> selectOrgani(int startPage, int limit, HashMap<String, String> paramMap) { // 특정 페이지 단위의 게시글 조
					int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
					RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowbounds
					return sqlSession.selectList("Member.selectOgUser",paramMap,row);
				}
				
				//사원 부서 수정, 삭제 조건
				public int updateDept(Member m) { // 글 수정 
					return sqlSession.update("Member.updateDept", m);
				}
				public List<Member> deleteOrgani(HashMap<String, String> paramMap1) { // 특정 페이지 단위의 게시글 조
					System.out.println("다오까지 옴");
					return sqlSession.selectList("Member.deleteOrgani", paramMap1);
				}
}
