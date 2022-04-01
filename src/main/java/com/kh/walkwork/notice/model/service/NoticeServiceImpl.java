package com.kh.walkwork.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.Attachment;
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
	public Notice selectNotice(Notice n) {
		return noticeDao.selectNotice(sqlSession, n);
	}

	@Override
	public ArrayList<Attachment> selectFile(Notice n) {
		return noticeDao.selectFile(sqlSession, n);
	}
	
	
	@Override
	public Notice insertNotice(Notice n) {

		return noticeDao.insertNotice(sqlSession, n);
		
	}

	@Override
	public int deleteNotice(Notice n) {
		return noticeDao.deleteNoitce(sqlSession, n);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}


	@Override
	public ArrayList<Notice> rangeNotice(String noticeRange, PageInfo pi) {
		return noticeDao.rangeNotice(sqlSession, noticeRange, pi);
	}
	
	@Override
	public int selectRangeListCount(String noticeRange) {
		return noticeDao.selectRangeListCount(sqlSession, noticeRange);
	}

	@Override
	public ArrayList<Notice> selectTopList() {
		return noticeDao.selectTopList(sqlSession);
	}

	@Override
	public int selectAttachCount(int bno) {
		return noticeDao.selectAttachCount(sqlSession, bno);
	}
	
	@Override
	public int deleteFile(int fileLength, int boardNo) {
		return noticeDao.deleteFile(sqlSession, fileLength, boardNo);
	}
	
	//메인
	@Override
	public ArrayList<Notice> selectNoticeList() {
		return noticeDao.selectNoticeList(sqlSession);
	}








}
