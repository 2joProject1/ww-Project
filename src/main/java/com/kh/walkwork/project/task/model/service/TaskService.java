package com.kh.walkwork.project.task.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
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
	
	//업무 : 상세보기
	public Task getTaskDetail(Task t) {
		return taskDao.getTaskDetail(sqlSession, t);
	}

	//업무 : 업무목록
	public List<Task> getTaskList(Project p) {
		return taskDao.getTaskList(sqlSession, p);
	}

	//업무: 필터별 보기
	public List<Task> getTaskListByFilter(Task t) {
		return taskDao.getTaskListByFilter(sqlSession, t);
	}
	
	//업무: 수정
	public int updateTask(Task t) {
		return taskDao.updateTask(sqlSession, t);
	}
	
	//업무 : 차트
	@SuppressWarnings("unused")
	public int taskStateList(Task t) throws Exception {
		Integer value = taskDao.taskStateList(sqlSession, t);
		if (value != null) {
			return value;
		} else {
			return 0;
		}
	}
	
	//업무 : 댓글 삭제하기
	public int deleteTaskReplyList(Reply r) {
		return taskDao.deleteTaskReplyList(sqlSession, r);
	}
	

	
	
	
}
