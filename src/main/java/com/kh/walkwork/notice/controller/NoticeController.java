package com.kh.walkwork.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@RequestMapping("notice.no")
	public String selectNoticeList(){
		
		return "notice/noticeListView";
	}
	@RequestMapping("insert.no")
	public String insertNotice(){
		
		return "notice/noticeInsertView";
	}
	@RequestMapping("update.no")
	public String updateNotice(){
		
		return "notice/noticeUpdqteView";
	}
	@RequestMapping("detail.no")
	public String detailNotice(){
		
		return "notice/noticeDetailView";
	}
}
