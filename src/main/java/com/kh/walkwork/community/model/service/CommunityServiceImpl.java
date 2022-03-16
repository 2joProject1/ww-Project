package com.kh.walkwork.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.community.model.dao.CommunityDao;
import com.kh.walkwork.community.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommunityDao communityDao;
	
	@Override
	public int insertCommunity(Community c) {
		return communityDao.insertCommunity(sqlSession, c);
	}
	
	
	
	
	@Override
	public int selectListCount() {
		return communityDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Community> selectList(PageInfo pi) {
		return communityDao.selectList(sqlSession, pi);
	}
	
	
	@Override
	public ArrayList<Community> selectTopCm() {
		return communityDao.selectTopCm(sqlSession);
	}
	
	@Override
	public Community selectDetail(int pageNo) {
		return communityDao.selectDetail(sqlSession, pageNo);
	}
	
	@Override
	public int insertAttachment(Attachment a) {
		return communityDao.insertAttachment(sqlSession, a);
	}
	
	
	@Override
	public int lastBno() {
		return communityDao.lastBno(sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectAttachmentDetail(int pageNo) {
		return communityDao.selectAttachmentDetail(sqlSession, pageNo);
	}
}
