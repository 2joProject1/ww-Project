package com.kh.walkwork.common.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.notice.model.service.NoticeService;
import com.kh.walkwork.notice.model.vo.Notice;

@Controller
public class mainPage {
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("main")
	public ModelAndView returnMain(ModelAndView mv) { 
		mv.addObject("notice", noticeService.selectNoticeList());
//		mv.addObject("todo", noticeService.selectToDoList());
		mv.setViewName("common/main");
		
		return mv;
	}
}

