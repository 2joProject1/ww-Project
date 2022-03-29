package com.kh.walkwork.project.task.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.community.model.vo.Reply;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.project.task.model.dao.TaskDao;
import com.kh.walkwork.project.task.model.vo.Task;

@Service
public class TaskService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TaskDao taskDao;
	
	//업무 생성
	public int insertTask(Task t) {
		return taskDao.insertTask(sqlSession, t);
	}
	
	//업무 : 댓글 가져오기
	public List<Reply> getTaskReplyList(Task t) {
		return taskDao.getTaskReplyList(sqlSession, t);
	}
	
	//업무 : 댓글 작성하기
	public int insertReplyList(Reply r) {
		return taskDao.insertReplyList(sqlSession, r);
	}
	public Task getTaskDetail(Task t) {
		return taskDao.getTaskDetail(sqlSession, t);
	}

	public List<Task> getTaskList(Project p) {
		return taskDao.getTaskList(sqlSession, p);
	}

	public List<Task> getTaskListByFilter(Task t) {
		return taskDao.getTaskListByFilter(sqlSession, t);
	}

	public int updateTask(Task t) {
		return taskDao.updateTask(sqlSession, t);
	}

	
	
	
}
