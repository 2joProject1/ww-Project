package com.kh.walkwork.dept.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;

@Repository("deptDao")
public class DeptDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	//부서 목록 뿌리기
	public List<Dept> selectListDept(String cno){
		return sqlSession.selectList("Dept.selectListDept", cno);
	}
	
	
	public int listCount(String cno) {
		return sqlSession.selectOne("Dept.listCount", cno);
	}
	public List<Dept> selectDept(String cno) {
		return sqlSession.selectList("Dept.selectDept", cno);
	}
	public Dept selectDtOne(String deptNo) { 
		return sqlSession.selectOne("Dept.selectvone", deptNo);
	}
	public int searchlistCount() {
		return sqlSession.selectOne("Dept.searchlistCount");
	}
	public List<Dept> searchDept(String keyword) { // 게시글 검색 조회 
		return sqlSession.selectList("Dept.searchDept", keyword);
	}
	public int insertDept(Dept d) { // 글 입력 
		return sqlSession.insert("Dept.insertDept", d);
	}
	public int deleteDept(HashMap<String, String> paramMap2) { 
		
		
		return sqlSession.delete("Dept.deleteDept", paramMap2);
	}
	public int updateDept(Member vo) { 
		return sqlSession.delete("Dept.updateDept", vo);
	}
	
	
	public String deptNameChk(String deptNo) throws Exception {
		return sqlSession.selectOne("Dept.deptNameChk", deptNo);
	}
	
	

}

