package com.kh.walkwork.project.task.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.community.model.vo.Reply;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.project.task.model.vo.Task;

@Repository
public class TaskDao {
	
	//업무생성
	public int insertTask(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.insert("taskMapper.insertTask", t);
	}
	
	//업무 : 댓글 작성하기
	public int insertReplyList(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("taskMapper.insertReplyList", r);
	}

	//업무 : 댓글 가져오기
	public List<Reply> getTaskReplyList(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.selectList("taskMapper.getTaskReplyList", t);
	}

	public Task getTaskDetail(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.selectOne("taskMapper.getTaskDetail", t);
	}

	public List<Task> getTaskList(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.selectList("taskMapper.getTaskList", p);
	}

	public List<Task> getTaskListByFilter(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.selectList("taskMapper.getTaskListByFilter", t);
	}

	public int updateTask(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.update("taskMapper.updateTask", t);
	}



}
