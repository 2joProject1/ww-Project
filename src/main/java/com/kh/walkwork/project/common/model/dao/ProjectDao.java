package com.kh.walkwork.project.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.vo.Project;

@Repository
public class ProjectDao {

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	public List<Member> selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("projectMapper.selectMember", m);
	}

	public List<Dept> selectDept(SqlSessionTemplate sqlSession, Dept m) {
		return sqlSession.selectList("projectMapper.selectDept", m);
	}

}
