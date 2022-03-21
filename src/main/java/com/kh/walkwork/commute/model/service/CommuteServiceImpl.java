package com.kh.walkwork.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.commute.model.dao.CommuteDao;
import com.kh.walkwork.commute.model.vo.Commute;

@Service
public class CommuteServiceImpl implements CommuteService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDao commuteDao;

	@Override
	public int insertCommute(Commute commute) {
		return commuteDao.insertCommute(sqlSession, commute);
	}

	@Override
	public int updateCommute(Commute commute) {
		return commuteDao.updateCommute(sqlSession, commute);
	}

	@Override
	public int checkCommute(Commute commute) {
		return commuteDao.checkCommute(sqlSession, commute);
	}

	@Override
	public int checkEnd(Commute commute) {
		return commuteDao.checkEnd(sqlSession, commute);
	}

	@Override
	public int checkLate(Commute commute) {
		return commuteDao.checkLate(sqlSession, commute);
	}

	@Override
	public ArrayList<Commute> selectListCommute(Commute commute, PageInfo pi) {
		return commuteDao.selectListCommute(sqlSession, commute, pi);
	}

	@Override
	public int selectListCount(Commute commute) {
		return commuteDao.selectListCount(sqlSession, commute);
	}
	
	
	
}
