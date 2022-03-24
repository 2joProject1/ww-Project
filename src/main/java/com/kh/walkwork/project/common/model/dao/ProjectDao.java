package com.kh.walkwork.project.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.vo.Project;

@Repository
public class ProjectDao {

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectMember", m);
	}

}
