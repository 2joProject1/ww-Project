package com.kh.walkwork.project.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.member.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.service.ProjectService;
import com.kh.walkwork.project.common.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("project.main")
	public String main() {
		return "project/common/projectMain";
	}

	@RequestMapping("project.no-read")
	public String projectNoRead() {
		return "project/common/projectMainNoRead";
	}

	@RequestMapping("project")
	public ModelAndView projectDetailView(int pno) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("project/common/projectDetailView");
		mv.addObject("projectNo", pno);
		
		return mv;
	}

	@RequestMapping("project.taskWrite")
	public ModelAndView projectTaskWrite(int pno) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("project/task/projectTaskWrite");
		mv.addObject("projectNo", pno);
		return mv;
	}
	
	//프로젝트 생성
	@RequestMapping("insert.pro")
	public String insertProject(Project p, HttpSession session) {
		
		int result = projectService.insertProject(p);
		
		if(result>0) {
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
	
	//프로젝트 생성 - 사원검색
	@ResponseBody
	@RequestMapping("docubox.searchDept")
	public Map<String, Object> searchDept(String name, String dept) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Dept> searched = projectService.searchDept(dept);
		map.put("depts",searched);
	
		return map;
	}

	

}
