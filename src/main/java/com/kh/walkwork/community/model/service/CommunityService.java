package com.kh.walkwork.community.model.service;

import java.util.ArrayList;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.community.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.community.model.vo.Reply;

public interface CommunityService {

	// 커뮤니티 작성하기 서비스(insert)
	public int insertCommunity(Community c);
	
	// 커뮤니티 수정
	public int updateCommunity(Community c);
	
	// 커뮤니티 삭제
	public int deleteCommunity(int bno);
	
	// 총 게시물 수
	public int selectListCount();
	
	// 커뮤니티 리스트 조회
	public ArrayList<Community> selectList(PageInfo pi);
	
	public ArrayList<Community> selectTopCm();
	public ArrayList<Attachment> selectViewAtt();
	
	// 커뮤니티 상세조회
	public Community selectDetail(int pageNo);
	
	
	// 커뮤니티 파일 삽입
	public int insertAttachment(Attachment a);
	
	public int lastBno();
	
	// 상세 게시판 사진
	public ArrayList<Attachment> selectAttachmentDetail(int pageNo);
	
	// 댓글
	public int insertReply(Reply r);
	
	public ArrayList<Reply> selectReply(int bno);
}
