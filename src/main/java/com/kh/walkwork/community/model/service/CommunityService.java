package com.kh.walkwork.community.model.service;

import java.util.ArrayList;

import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.community.model.vo.PageInfo;

public interface CommunityService {

	// 커뮤니티 작성하기 서비스(insert)
	int insertCommunity(Community c);
	
	// 총 게시물 수
	public int selectListCount();
	
	// 커뮤니티 리스트 조회
	ArrayList<Community> selectList(PageInfo pi);
	
	
}
