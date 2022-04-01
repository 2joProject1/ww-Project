package com.kh.walkwork.project.common.model.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.dao.ProjectDao;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.project.common.model.vo.ProjectMember;

@Service
public class ProjectService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProjectDao projectDao;
	
	//프로젝트 생성
	public int insertProject(Project p) {
		return projectDao.insertProject(sqlSession, p);
	}
	
	//프로젝트생성 : 프로젝트 멤버
	public int insertProjectMember(ProjectMember p) {
		return projectDao.insertProjectMember(sqlSession, p);
	}
	
	//사원검색
	public List<Member> searchMember(String name,String dept){
		List<Member> list = new ArrayList<Member>();
		
		try {
			Member m = new Member();
			m.setMemberName(name);
			m.setDeptName(dept);
			
			list = projectDao.selectMember(sqlSession, m);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//부서검색
	public List<Dept> searchDept(String dept) {
		List<Dept> list = new ArrayList<Dept>();
		
		try {
			Dept m = new Dept();
			m.setDeptName(dept);
			
			list = projectDao.selectDept(sqlSession, m);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	//프로젝트 글 수
	public int selectProjectListCount(Project p) {
		return projectDao.selectProjectListCount(sqlSession, p);
	}
	
	//프로젝트 메인: 프로젝트 리스트(내프로젝트)
	public List<Project> selectProjectList(Project p) {
		return projectDao.selectProjectList(sqlSession, p);
	}
	
	//프로젝트 메인 : 부서별보기
	public List<Project> selectProjectListDept(Project p) {
		return projectDao.selectProjectListDept(sqlSession, p);
	}
	
	//프로젝트 상세보기: 진행중,완료 여부
	public int endProject(Project p) {
		return projectDao.endProject(sqlSession, p);
	}
	
	//프로젝트 상세보기:  
	public List<Project> selectProjectDetailList(Project p) {
		return projectDao.selectProjectDetailList(sqlSession, p);
	}
	
	//프로젝트 생성하기 : 프로젝트 멤버 리스트 가져오기
	public List<ProjectMember> getProjectMemberList(Project p) {
		return projectDao.getProjectMemberList(sqlSession, p);
	}
	
	
	
	//프로젝트 읽음, 읽지않음 여부
	
	

	
	
}
