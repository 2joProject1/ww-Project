package com.kh.walkwork.notice.model.service;

import java.util.ArrayList;

import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.notice.model.vo.Notice;

public interface NoticeService {
	// Notice
	int 					selectNoticeListCount();
	ArrayList<Notice> 		selectNoticeList(PageInfo pi);
	Notice 					selectNotice(Notice n);
	ArrayList<Attachment> 	selectFile(Notice n);	
	int 					selectRangeListCount(String noticeRange);
	ArrayList<Notice> 		selectTopList();

	int 					increaseCount(int bno);
	Notice 					insertNotice(Notice n);
	
	int 					deleteNotice(Notice n);

	int 					updateNotice(Notice n);

	ArrayList<Notice> 		rangeNotice(String noticeRange, PageInfo pi);

	int 					selectAttachCount(int bno);
	int deleteFile(int fileLength, int boardNo);
	
	// 메인
	ArrayList<Notice> 		selectNoticeList();
	
}
