package com.kh.walkwork.notice.model.service;

import java.util.ArrayList;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.notice.model.vo.Notice;

public interface NoticeService {
	int selectNoticeListCount();
	
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	int increaseCount(int bno);
	
	ArrayList<Notice> selectNotice(Notice n);
	
	Notice insertNotice(Notice n);
}
