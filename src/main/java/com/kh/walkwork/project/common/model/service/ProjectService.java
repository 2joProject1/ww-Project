package com.kh.walkwork.project.common.model.service;

import java.util.ArrayList;
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
import com.kh.walkwork.project.common.model.vo.ProjectNotice;

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
	
	//프로젝트 메인 : 완료된 프로젝트
	public List<Project> selectProjectListFinish(Project p) {
		return projectDao.selectProjectListFinish(sqlSession, p);
	}
	
	//프로젝트 상세보기: 진행중,완료 여부
	public int endProject(Project p) {
		return projectDao.endProject(sqlSession, p);
	}
	
	//프로젝트 상세보기:  
	public Project selectProjectDetailList(Project p) {
		return projectDao.selectProjectDetailList(sqlSession, p);
	}
	
	//프로젝트 생성하기 : 프로젝트 멤버 리스트 가져오기
	public List<ProjectMember> getProjectMemberList(Project p) {
		return projectDao.getProjectMemberList(sqlSession, p);
	}

	//프로젝트 공지 작성하기
	public int insertProjectNotice(ProjectNotice pn) {
		return projectDao.insertProjectNotice(sqlSession, pn);
	}
	
	//프로젝트 공지 리스트 불러오기
	public List<ProjectNotice> selectProjectNoticeList(ProjectNotice pn) {
		return projectDao.selectProjectNoticeList(sqlSession, pn);
	}
	
	//프로젝트 공지 조회수 업데이트
	public int increasePrjectNoticeCount() {
		return projectDao.increasePrjectNoticeCount(sqlSession);
	}
	
	//프로젝트 공지 수정하기
	public int updateProjectNotice(ProjectNotice pn) {
		return projectDao.updateProjectNotice(sqlSession, pn);
	}
	
	//프로젝트 공지 삭제하기
	public int deleteProjectNotice(ProjectNotice pn) {
		return projectDao.deleteProjectNoitce(sqlSession, pn);
	}
	


	public ProjectNotice selectProjectNoticeOne(ProjectNotice pn) {
		return projectDao.selectProjectNoticeOne(sqlSession, pn);
	}

	
	
	public List<Project> selectMainProjectList(Project p) {
		return projectDao.selectProjectMainList(sqlSession, p);
	}

}
