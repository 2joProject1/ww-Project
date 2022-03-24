package com.kh.walkwork.header.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Member;

@Controller
public class HeaderController {
	
	@Autowired
	private MemberService memberService;
	
	// 유저리스트 ajax로 뿌리기
	@ResponseBody
	@RequestMapping("addrList")
	public ArrayList<Member> addrList(){
		
		ArrayList<Member> addrList = memberService.selectAddrList();
		
//		System.out.println("연락처 리스트 : " + addrList);
		
		return addrList;
	}

}
