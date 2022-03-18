package com.kh.walkwork.project.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class projectController {

	@RequestMapping("project.main")
	public String main() {
		return "project/common/projectMain";
	}
	
	@RequestMapping("project.no-read")
	public String projectNoRead() {
		return "project/common/projectMainNoRead";
	}
	
			
	@RequestMapping("project")
	public String projectDetailView() {
		return "project/common/projectDetailView";
	}
	
			
	@RequestMapping("project.taskWrite")
	public String projectTaskWrite() {
		return "project/task/projectTaskWrite";
	}
			
			
}
