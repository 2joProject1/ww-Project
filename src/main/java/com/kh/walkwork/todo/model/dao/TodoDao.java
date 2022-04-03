package com.kh.walkwork.todo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.todo.model.vo.Todo;

@Repository
public class TodoDao {

	public ArrayList<Todo> selectTodoList(SqlSessionTemplate sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoList", memberNo);
	}

//	public ArrayList<Todo> mainTodoList(SqlSessionTemplate sqlSession, String memberNo) {
//		return (ArrayList)sqlSession.selectList("todoMapper.mainTodoList", memberNo);
//	}
//	
//	public int mainTodoDelete(SqlSessionTemplate sqlSession, Todo todo) {
//		return sqlSession.update("todoMapper.mainTodoDelete", todo);
//	}
	
}
