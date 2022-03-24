package com.kh.walkwork.project.common.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.member.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.dao.ProjectDao;
import com.kh.walkwork.project.common.model.vo.Project;

@Service
public class ProjectService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProjectDao projectDao;
	
	public int insertProject(Project p) {
		return projectDao.insertProject(sqlSession, p);
		
		
	}
	
	public List<Member> searchMember(String name,String dept){
		List<Member> lst = new ArrayList<Member>();
		
		try {
			Member m = new Member();
			m.setMemberName(name);
			m.setDeptName(dept);
			
			lst = projectDao.selectMember(sqlSession, m);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return lst;
	}

	public List<Dept> searchDept(String dept) {
		List<Dept> lst = new ArrayList<Dept>();
		
		try {
			Dept m = new Dept();
			m.setDeptName(dept);
			
			lst = projectDao.selectDept(sqlSession, m);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return lst;
	}

	
}
