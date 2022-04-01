package com.kh.walkwork.community.model.service;

import java.util.ArrayList;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.BoardGood;
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
	public int selectListCount(String search);
	
	// 내 게시물 총 수
	public int selectMyListCount(Community c);
	
	// 커뮤니티 리스트 조회
	public ArrayList<Community> selectList(PageInfo pi, String search);
	
	// 내 게시물 조회
	public ArrayList<Community> selectMyCommunity(PageInfo pi, Community c);
	
	public ArrayList<Community> selectTopCm();
	public ArrayList<Attachment> selectViewAtt();
	public ArrayList<Attachment> selectboardAtt(int[] listNo);
	public int replyCnt(int bno);
	// 커뮤니티 상세조회
	public Community selectDetail(int pageNo);
	
	
	// 커뮤니티 파일 삽입
	public int insertAttachment(Attachment a);
	public int deleteAttachment(String[] c);
	
	public int lastBno();
	
	// 상세 게시판 사진
	public ArrayList<Attachment> selectAttachmentDetail(int pageNo);
	
	// 댓글
	public int insertReply(Reply r);
	
	public ArrayList<Reply> selectReply(int bno);
	
	// 댓글 삭제
	public int deleteReply(Reply r);
	
	public int thumbsPlus(Community c);
	public int thumbsMinus(Community c);
	
	// 추천 중복 방지 
	
	public int insertThumbsGood(BoardGood g);
	public int deleteThumbsGood(BoardGood g);
	public int selectThumbsGood(BoardGood g);
	
	
	
}
