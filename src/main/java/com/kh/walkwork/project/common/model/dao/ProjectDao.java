package com.kh.walkwork.project.common.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.project.common.model.vo.ProjectMember;
import com.kh.walkwork.project.common.model.vo.ProjectNotice;

@Repository
public class ProjectDao {

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}

	public int insertProjectMember(SqlSessionTemplate sqlSession, ProjectMember pm) {
		return sqlSession.insert("projectMapper.insertProjectMember", pm);
	}

	public List<Member> selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("projectMapper.selectMember", m);
	}

	public List<Dept> selectDept(SqlSessionTemplate sqlSession, Dept m) {
		return sqlSession.selectList("projectMapper.selectDept", m);
	}

	// 프로젝트 글 수
	public int selectProjectListCount(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectOne("projectMapper.selectProjectListCount", p);
	}

	// 프로젝트 메인 : 프로젝트 리스트(내 프로젝트)
	public List<Project> selectProjectList(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectList("projectMapper.selectProjectList", p);
	}

	// 프로젝트 메인 : 프로젝트 리스트(완료)
	public List<Project> selectProjectListFinish(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectList("projectMapper.selectProjectListFinish", p);
	}

	// 프로젝트 상세보기 : 진행중, 완료여부
	public int endProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.update("projectMapper.endProject", p);
	}

	// 프로젝트 상세보기 : 프로젝트 내용
	public Project selectProjectDetailList(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectOne("projectMapper.selectProjectDetailList", p);
	}

	// 프로젝트 상세보기: 프로젝트 멤버리스트
	public List<ProjectMember> getProjectMemberList(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectList("projectMapper.getProjectMemberList", p);
	}

	// 프로젝트 메인 : 프로젝트 공지 가져오기
	public List<ProjectNotice> selectProjectNoticeList(SqlSessionTemplate sqlSession, ProjectNotice pn) {
		return (ArrayList) sqlSession.selectList("projectNoticeMapper.selectProjectNoticeList", pn);
	}

	// 프로젝트 상세 : 공지 작성하기
	public int insertProjectNotice(SqlSessionTemplate sqlSession, ProjectNotice pn) {
		return sqlSession.insert("projectNoticeMapper.insertProjectNotice", pn);
	}

	// 프로젝트 상세 : 공지 조회수올리기
	public int increasePrjectNoticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.update("projectNoticeMapper.increasePrjectNoticeCount");
	}

	// 프로젝트 상세 : 공지 수정하기
	public int updateProjectNotice(SqlSessionTemplate sqlSession, ProjectNotice pn) {
		return sqlSession.update("projectNoticeMapper.updateProjectNotice", pn);
	}

	// 프로젝트 상세 : 공지 삭제하기
	public int deleteProjectNoitce(SqlSessionTemplate sqlSession, ProjectNotice pn) {
		return sqlSession.update("projectNoticeMapper.deleteProjectNotice", pn);
	}

	public ProjectNotice selectProjectNoticeOne(SqlSessionTemplate sqlSession, ProjectNotice pn) {
		return sqlSession.selectOne("projectNoticeMapper.selectProjectNoticeOne", pn);
	}

	public List<Project> selectProjectMainList(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectList("projectMapper.selectMainProjectList", p);
	}

}
