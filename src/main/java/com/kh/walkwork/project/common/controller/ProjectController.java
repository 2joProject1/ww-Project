package com.kh.walkwork.project.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.service.ProjectService;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.project.common.model.vo.ProjectMember;
import com.kh.walkwork.project.task.model.service.TaskService;
import com.kh.walkwork.project.task.model.vo.Task;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private TaskService taskService;
	
	
	//프로젝트 메인 : 읽지않음
	@RequestMapping("project.no-read")
	public String projectNoRead() {
		return "project/common/projectMainNoRead";
	}
	
	//프로젝트 메인 : 프로젝트 리스트 가져오기(내프로젝트)
	@RequestMapping("project.main")
	public String main(Project p, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		p.setProjectMemberNo(loginUser.getMemberNo());
		List<Project> list = projectService.selectProjectList(p);
		
		model.addAttribute("list", list);

		return "project/common/projectMain";
	}
	
	
	
	//프로젝트 메인 : 프로젝트 리스트 가져오기(부서별)
	@RequestMapping("projectDept.main")
	public String mainDept(Project p, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		p.setProjectMemberNo(loginUser.getMemberNo());
		List<Project> list = projectService.selectProjectListDept(p);
		
		model.addAttribute("list", list);

		return "project/common/projectMain";
	}
	
	
	
	
	
	//프로젝트메인 : 개별프로젝트 클릭시 이동
	@RequestMapping("project")
	public ModelAndView projectDetailView(Project p, ModelAndView mv, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return new ModelAndView("redirect:/");
		}
		mv.setViewName("project/common/projectDetailView"); // projectDetailView.jsp 안에서 쓸수 있는게 "projectNo"

		List<Project> list = projectService.selectProjectDetailList(p);
		List<Task> taskList = taskService.getTaskList(p);
		mv.addObject("projectNo", p.getProjectNo());
		mv.addObject("list", list);
		mv.addObject("taskList", taskList);
		
		return mv;
	}

	

	//프로젝트: 업무작성하기 버튼 클릭시 이동
	@RequestMapping("project.taskWrite")
	public ModelAndView projectTaskWrite(Project p, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return new ModelAndView("redirect:/");
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("project/task/projectTaskWrite");
		List<Project> list = projectService.selectProjectDetailList(p);
		List<ProjectMember> projectMemberList = projectService.getProjectMemberList(p);

		mv.addObject("list", list);
		mv.addObject("projectMemberList", projectMemberList);
		mv.addObject("projectNo", p.getProjectNo());
		return mv;
	}
	
	//프로젝트 생성
	@RequestMapping("insert.pro")
	public String insertProject(Project p, HttpSession session) {
		
		int result = projectService.insertProject(p);
		String[] members = p.getProjectMemberNo().split(","); //프로젝트에 추가된 결재자들 쪼개기
		
		if(result>0) { //사원번호, 프로젝트번호 세팅해서 프로젝트멤버 테이블에 insert 
			for (int i=0; i<members.length; i++) {
				String memberNo = members[i];
				ProjectMember pm = new ProjectMember();
				pm.setMemberNo(memberNo);	
				pm.setProjectNo(p.getProjectNo());
				
				projectService.insertProjectMember(pm);
			}
			session.setAttribute("alertMsg", "새 프로젝트가 생성되었습니다");
			return "redirect:project.main";
		} else {
			session.setAttribute("errorMsg", "새 프로젝트가 생성에 실패하였습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}
	
	//프로젝트 생성 - 사원검색
	@ResponseBody
	@RequestMapping("search.member")
	public Map<String, Object> selectMember(String name, String dept) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Member> searched = projectService.searchMember(name, dept);
		map.put("members",searched);
	
		return map;
	}
	
	//프로젝트 생성 - 부서검색
	@ResponseBody
	@RequestMapping("docubox.searchDept")
	public Map<String, Object> searchDept(String name, String dept) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Dept> searched = projectService.searchDept(dept);
		map.put("depts",searched);
	
		return map;
	}
	
	//프로젝트 진행중,완료 설정
	@ResponseBody
	@RequestMapping("project.end")
	public String endProject(Project p, HttpSession session) {
		int result = projectService.endProject(p);

		if(result>0) {
			return "project/projectDetailView";
		} else {
			return "common/errorPage";
		}
	}
	
	//프로젝트 상세보기 
	@RequestMapping("project.det")
	public ModelAndView selectProjectDetailList(Project p, ModelAndView mv) {
		
		List<Project> list = projectService.selectProjectDetailList(p);
		mv.addObject("list", list).setViewName("project/common/projectInfo");

		return mv;
	}


}
