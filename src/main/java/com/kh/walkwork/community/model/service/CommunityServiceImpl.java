package com.kh.walkwork.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.community.model.dao.CommunityDao;
import com.kh.walkwork.community.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.community.model.vo.Reply;

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
	public int updateCommunity(Community c) {
		return communityDao.updateCommunity(sqlSession, c);
	}
	
	@Override
	public int deleteCommunity(int bno) {
		return communityDao.deleteCommunity(sqlSession, bno);
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
	public ArrayList<Attachment> selectViewAtt() {
		return communityDao.selectViewAtt(sqlSession);
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
	
	@Override
	public int insertReply(Reply r) {
		return communityDao.insertReply(sqlSession, r);
	}
	
	@Override
	public ArrayList<Reply> selectReply(int bno) {
		return communityDao.selectReply(sqlSession, bno);
	}
}
