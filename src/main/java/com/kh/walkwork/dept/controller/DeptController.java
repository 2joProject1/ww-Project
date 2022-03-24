package com.kh.walkwork.dept.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.walkwork.dept.model.service.DeptService;
import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.dao.MemberDao;
import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Member;

@Controller
public class DeptController {

	@Autowired
	private DeptService deptServ;
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private MemberDao MemberDao;
	
	
	
	public static final int LIMIT = 10;
	
	//부서
	@SuppressWarnings("unused")
	@RequestMapping(value = "deptlist", method = RequestMethod.GET)
	public ModelAndView selectDept(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "deptName", required = false) String deptName,
			Authentication authentication, ModelAndView mv) {
			
//			CustomMemberDetails userdetail = (CustomMemberDetails) authentication.getPrincipal();
//			String MemberNo=userdetail.getMemberNo();
			
			
		try {
			//String cname = companyDao.cnameOne(cno);
			HashMap<String, String> paramMap = new HashMap<String, String>();
//			paramMap.put("MemberNo", MemberNo);
			paramMap.put("deptName", deptName);
			//
			int currentPage = page;
//			부서 출력
//			int deptlistCount1 = deptServ.listCount(MemberNo);
			int deptlistCount2 = deptServ.searchlistCount();
//			부서 사원 출력
//			int listCount1 = MemberService.listCountFirst(MemberNo);
			int listCount2 = MemberService.listCount(paramMap);
			
//			int maxPage1 = (int) ((double) listCount1 / LIMIT + 0.9);
			int maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
			
//			mv.addObject("deptlistCount", deptlistCount1);
//			mv.addObject("selectDept", deptServ.selectDept(MemberNo));
			
			mv.setViewName("/ogChart/ogChartListView");

//			미분류그룹 default
			if (deptName == null) {
//				mv.addObject("MemberlistCount", listCount1);
				mv.addObject("currentPage", currentPage);
//				mv.addObject("maxPage", maxPage1);
				mv.addObject("deptName", "미분류그룹");
				//mv.addObject("cname", cname);
//				mv.addObject("list", MemberService.selectOgFirst(currentPage, LIMIT, MemberNo));
				mv.setViewName("/ogChart/ogChartListView");
			}
			else if (deptName != null){
				mv.addObject("MemberlistCount", listCount2);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage2);
				mv.addObject("deptName", deptName);
				//mv.addObject("cname", cname);
				mv.addObject("list", MemberService.selectOgUser(currentPage, LIMIT, paramMap));
				mv.setViewName("/ogChart/ogChartListView");
			} 
//			부서검색			
			if(keyword != null && keyword != "") {
				mv.addObject("deptlistCount", deptlistCount2);
				mv.addObject("list", deptServ.searchDept(keyword));
				mv.setViewName("/ogChart/ogChartListView");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	/*
	//부서 변경
	@RequestMapping(value = "/ogChart/organuserupdate", method = RequestMethod.POST)
	public ModelAndView updateDept(Dept d, 
				@RequestParam(name = "deptSelect") String deptNo,
				@RequestParam(name = "chk") List<String> MemberNo,
				ModelAndView mv, Authentication authentication) {
		//CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		//String MemberNo=userdetail.getMemberNo();
		
		List<Member> list = new ArrayList<Member>();
		//List<ProjectMember> pmlist = new ArrayList<ProjectMember>();
		//ProjectMember pmdto = null;
		Member one = null;
		Dept Dept = new Dept();
		//Dept.setCno(cno);
		//Dept.setdeptNo(deptNo);
		try {
			//String deptpno = deptServ.selectDeptPno(Dept);

			for(int i = 0; i < MemberNo.size(); i++) {
				one = new Member();
				//one.setMemberNo(MemberNo.get(i));
				//one.setdeptNo(deptNo);
				list.add(one);
				
				//pmdto = new ProjectMember();
				//pmdto.setMemberNo(MemberNo.get(i));
				//pmdto.setPno(deptpno);
				//pmdto.setCno(cno);
				//pmlist.add(pmdto);
			}
			deptServ.updateDept(list);
			//int rs = pmService.projectMeberinvite(pmlist);
			
			
			mv.setViewName("redirect:deptlist");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	//
	//부서 생성
	@RequestMapping(value = "/ogChart/addDept", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertDept(Dept d, RedirectAttributes rttr, Authentication authentication) {
		try {
			
			//CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			//String cno=userdetail.getCno();
			//String MemberNo=userdetail.getMemberNo();
			
			
			HashMap<String, String> paramMap1 = new HashMap<String, String>();
			//paramMap1.put("pname", d.getdeptName());
			//paramMap1.put("cno", cno);
			
			HashMap<String, String> paramMap2 = new HashMap<String, String>();
			//paramMap2.put("MemberNo", MemberNo);
			//paramMap2.put("cno", cno);
			
			deptServ.insertDept(d);
			//MemberDao.joinPjChange(paramMap1);
			//MemberDao.joinPjMemChange(paramMap2);
			//MemberDao.joinPjDeptChange(cno);
			
			rttr.addFlashAttribute("message", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:deptlist";
	}
	
	//부서 삭제
//		@SuppressWarnings("unused")
//		@ResponseBody
@RequestMapping(value = "/ogChart/deptdel", method = RequestMethod.POST)
		public ModelAndView deleteDept(
				@RequestParam(name = "deptName") String deptName,
				@RequestParam(name = "deptNo") String deptNo,
				@RequestParam(name = "MemberNo") String MemberNo,
//				@RequestParam(name = "pno") String pno,
				Authentication authentication, HttpServletRequest request,
				ModelAndView mv,HttpServletResponse response) {
				
			try {
				
				HashMap<String, String> paramMap1 = new HashMap<String, String>();
				paramMap1.put("MemberNo", MemberNo);
				paramMap1.put("deptName", deptName);
				//
				HashMap<String, String> paramMap2 = new HashMap<String, String>();
				paramMap2.put("MemberNo", MemberNo);
				paramMap2.put("deptNo", deptNo);

				List<Member> deptUserList = MemberService.deleteOgUser(paramMap1);
//				List<ProjectDto> pjUserList = pjDao.PjUserListDept(pno);
				//
				if(deptUserList.size() == 0 || deptUserList == null) { //부서에 사람이 없는 경우만 삭제 가능하도록
					int rs1 = deptServ.deleteDept(paramMap2);
//					if(pjUserList.size() == 1) {
//						int rs2 = pjDao.deleteProject(pno);
//					}else {
//					}
					mv.addObject("message2", "success");
					mv.setViewName("redirect:deptlist");
				} else {
					mv.addObject("message2", "failed");
					mv.setViewName("redirect:deptlist");
				}
			} catch (Exception e) {
				
			}
			mv.setViewName("redirect:deptlist");
			return mv;
			
		}
	
	 */
}
