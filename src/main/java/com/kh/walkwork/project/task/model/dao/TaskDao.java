package com.kh.walkwork.project.task.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.project.task.model.vo.Task;

@Repository
public class TaskDao {

	public int insertTask(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.insert("taskMapper.insertTask", t);
	}

}
