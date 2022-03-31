package com.kh.walkwork.common.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.notice.model.service.NoticeService;
import com.kh.walkwork.project.common.model.service.ProjectService;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.schedule.model.service.ScheduleService;
import com.kh.walkwork.todo.model.service.TodoService;

@Controller
public class mainPage {
	@Autowired
	NoticeService noticeService;
	@Autowired
	TodoService todoService;
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("main")
	public ModelAndView returnMain(ModelAndView mv, HttpSession session, Project p) { 
		Member loginUser = (Member)session.getAttribute("loginUser");
		p.setProjectMemberNo(loginUser.getMemberNo());

		String memberNo = loginUser.getMemberNo();
		mv.addObject("notice", noticeService.selectNoticeList());
		mv.addObject("todo", todoService.mainTodoList(memberNo));
		mv.addObject("schedule", scheduleService.mainScheduleList(memberNo));
		mv.addObject("project",  projectService.selectProjectList(p));
		
		
		mv.setViewName("common/main");
		return mv;
	}

}

