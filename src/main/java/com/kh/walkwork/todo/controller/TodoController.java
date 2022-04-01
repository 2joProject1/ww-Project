package com.kh.walkwork.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.todo.model.service.TodoService;
import com.kh.walkwork.todo.model.vo.Todo;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService todoService;
	@ResponseBody
	@RequestMapping(value="complete.to", produces="application/json; charset=utf-8")
	public String mainTodoDelete(Todo todo, ModelAndView mv, HttpSession session) {
		System.out.println(todo);
		Member loginUser = (Member)session.getAttribute("loginUser");
		todo.setMemberNo(loginUser.getMemberNo());
		System.out.println(todo);
		int result = todoService.mainTodoDelete(todo);
		String memberNo = todo.getMemberNo();
		return new Gson().toJson(todoService.mainTodoList(memberNo));
	}
	
	@ResponseBody
	@RequestMapping(value="test.main", produces="application/json; charset=utf-8")
	public String testMain(ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");

		String memberNo = loginUser.getMemberNo();
		ArrayList<Todo> todo = todoService.mainTodoList(memberNo);
		
		return new Gson().toJson(todoService.mainTodoList(memberNo));
	}

}
