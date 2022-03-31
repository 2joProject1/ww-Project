package com.kh.walkwork.todo.model.service;

import java.util.ArrayList;

import com.kh.walkwork.todo.model.vo.Todo;

public interface TodoService {
	ArrayList<Todo> mainTodoList(String memberNo);

	int mainTodoDelete(Todo todo);
}
