package com.kh.walkwork.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.community.model.service.CommunityService;
import com.kh.walkwork.community.model.vo.Community;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// 글 작성하기
	@RequestMapping("insert.co")
	public String insertCommunity(Community c, Model model) {

		String str = "";

		c.setBoardWriter("익명"); // 임시 작성자 데이터 ! 나중에 삭제 후 실 member 데이터 사용
		int num = communityService.insertCommunity(c);

		return str;
	}

	// 글 가져오기
	@RequestMapping("list.co")
	public ModelAndView selectList(@RequestParam(value = "cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = communityService.selectListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Community> list = communityService.selectList(pi);
		
		System.out.println(list.get(0).getBoardTitle());
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("community/communityView");
		
		return mv;
	}
}
