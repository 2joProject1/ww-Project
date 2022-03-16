package com.kh.walkwork.community.model.service;

import java.util.ArrayList;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.community.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.Community;

public interface CommunityService {

	// 커뮤니티 작성하기 서비스(insert)
	public int insertCommunity(Community c);
	
	// 총 게시물 수
	public int selectListCount();
	
	// 커뮤니티 리스트 조회
	public ArrayList<Community> selectList(PageInfo pi);
	
	public ArrayList<Community> selectTopCm();
	
	// 커뮤니티 상세조회
	public Community selectDetail(int pageNo);
	
	
	// 커뮤니티 파일 삽입
	public int insertAttachment(Attachment a);
	
	public int lastBno();
	
	// 상세 게시판 사진
	public ArrayList<Attachment> selectAttachmentDetail(int pageNo);
}
