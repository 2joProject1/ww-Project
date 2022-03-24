package com.kh.walkwork.project.task.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.walkwork.project.task.model.service.TaskService;
import com.kh.walkwork.project.task.model.vo.Task;

@Controller
public class TaskController {
	
	@Autowired
	private TaskService taskService;

	@RequestMapping("insert.task")
	public String insertTask(Task t, HttpSession session) {
		int result = taskService.insertTask(t);
		
			
		if(result>0) {
			session.setAttribute("alertMsg", "업무 요청에 성공했습니다");
			return "redirect:project/task/projectTaskDetailView";
		} else {
			session.setAttribute("errorMsg", "업무 요청에 실패하였습니다. 다시 이용해주세요.");
			return "common/errorPage";
		}
	}
	
	
	
	
	
}
