package com.kh.walkwork.todo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.todo.model.dao.TodoDao;
import com.kh.walkwork.todo.model.vo.Todo;

@Service
public class TodoServiceImpl implements TodoService{
	@Autowired
	private TodoDao todoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	@Override
	public ArrayList<Todo> mainTodoList(String memberNo) {
		return todoDao.mainTodoList(sqlSession, memberNo);
	}


	@Override
	public int mainTodoDelete(Todo todo) {
		return todoDao.mainTodoDelete(sqlSession, todo);
	}
}
