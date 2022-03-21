package com.kh.walkwork.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.notice.model.dao.NoticeDao;
import com.kh.walkwork.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	
	@Override
	public int selectNoticeListCount() {
		return noticeDao.selectNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return noticeDao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int bno) {
		return noticeDao.increaseCount(sqlSession, bno);
	}

	@Override
	public ArrayList<Notice> selectNotice(Notice n) {
		return noticeDao.selectNotice(sqlSession, n);
	}

	@Override
	public Notice insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}

}
