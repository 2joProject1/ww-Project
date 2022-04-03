package com.kh.walkwork.project.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.community.model.vo.Reply;
import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.service.ProjectService;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.project.common.model.vo.ProjectMember;
import com.kh.walkwork.project.common.model.vo.ProjectNotice;
import com.kh.walkwork.project.task.model.service.TaskService;
import com.kh.walkwork.project.task.model.vo.Task;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@Autowired
	private TaskService taskService;

	// 프로젝트 메인 : 프로젝트 리스트 가져오기(내프로젝트)
	@RequestMapping("project.main")
	public String main(Project p, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		p.setProjectMemberNo(loginUser.getMemberNo());
		List<Project> list = projectService.selectProjectList(p);
		List<Project> flist = projectService.selectProjectListFinish(p);

		model.addAttribute("list", list);
		model.addAttribute("flist", flist);

		return "project/common/projectMain";
	}

	// 프로젝트메인 : 개별프로젝트 클릭시 이동
	@RequestMapping("project")
	public ModelAndView projectDetailView(Project param, ProjectNotice pn, ModelAndView mv, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return new ModelAndView("redirect:/");
		}
		mv.setViewName("project/common/projectDetailView"); // projectDetailView.jsp 안에서 쓸수 있는게 "projectNo"

		Project p = projectService.selectProjectDetailList(param);
		List<Task> taskList = taskService.getTaskList(param);
		mv.addObject("projectNo", param.getProjectNo());
		mv.addObject("p", p);
		mv.addObject("taskList", taskList);

		List<ProjectNotice> pnList = projectService.selectProjectNoticeList(pn);
		List<ProjectNotice> pnOrderedList = new ArrayList<ProjectNotice>();

		for (int i = 0; i < 3; i++) {
			if (i >= pnList.size()) {
				break;
			}
			pnOrderedList.add(pnList.get(i));
		}
		Member loginUser = (Member) session.getAttribute("loginUser");
		boolean isAdmin = false; // 글쓴이여부
		
		if ("99999".equals(loginUser.getMemberNo())) {
			// 세션에서 가져온 member No가 글쓴이인 경우
			isAdmin = true;
		}

		mv.addObject("pnList", pnOrderedList);
		mv.addObject("isAdmin", isAdmin);

		return mv;
	}

	// 프로젝트: 업무작성하기 버튼 클릭시 이동
	@RequestMapping("project.taskWrite")
	public ModelAndView projectTaskWrite(Project param, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return new ModelAndView("redirect:/");
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("project/task/projectTaskWrite");
		Project p = projectService.selectProjectDetailList(param);
		List<ProjectMember> projectMemberList = projectService.getProjectMemberList(param);

		mv.addObject("p", p);
		mv.addObject("projectMemberList", projectMemberList);
		mv.addObject("projectNo", param.getProjectNo());
		return mv;
	}

	// 프로젝트 생성
	@RequestMapping("insert.pro")
	public String insertProject(Project p, HttpSession session) {

		int result = projectService.insertProject(p);
		String[] members = p.getProjectMemberNo().split(","); // 프로젝트에 추가된 결재자들 쪼개기

		if (result > 0) { // 사원번호, 프로젝트번호 세팅해서 프로젝트멤버 테이블에 insert
			for (int i = 0; i < members.length; i++) {
				String memberNo = members[i];
				ProjectMember pm = new ProjectMember();
				pm.setMemberNo(memberNo);
				pm.setProjectNo(p.getProjectNo());

				projectService.insertProjectMember(pm);
			}
			session.setAttribute("alertMsg", "새 프로젝트가 생성되었습니다");
			return "redirect:project.main";
		} else {
			session.setAttribute("errorMsg", "새 프로젝트가 생성에 실패하였습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}

	// 프로젝트 생성 - 사원검색
	@ResponseBody
	@RequestMapping("search.member")
	public Map<String, Object> selectMember(String name, String dept) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Member> searched = projectService.searchMember(name, dept);
		map.put("members", searched);

		return map;
	}

	// 프로젝트 생성 - 부서검색
	@ResponseBody
	@RequestMapping("docubox.searchDept")
	public Map<String, Object> searchDept(String name, String dept) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Dept> searched = projectService.searchDept(dept);
		map.put("depts", searched);

		return map;
	}

	// 프로젝트 진행중,완료 설정
	@ResponseBody
	@RequestMapping("project.end")
	public String endProject(Project p, HttpSession session) {
		int result = projectService.endProject(p);

		if (result > 0) {
			return "project/projectDetailView";
		} else {
			return "common/errorPage";
		}
	}

	// 프로젝트 상세 : 작성하기 누르면 공지 작성 폼으로 이동
	@RequestMapping("project.noticeWrite")
	public ModelAndView projectNoticeWrite(Project param, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return new ModelAndView("redirect:/");
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("project/noticePro/noticeProEnrollForm");
		Project p = projectService.selectProjectDetailList(param);
		List<ProjectMember> projectMemberList = projectService.getProjectMemberList(param);

		mv.addObject("p", p);
		mv.addObject("projectMemberList", projectMemberList);
		mv.addObject("projectNo", param.getProjectNo());
		return mv;
	}

	// 프로젝트 상세 : 공지 작성
	@RequestMapping(value = "insertNotice.pro", method = RequestMethod.POST)
	public String insertProjectNotice(ProjectNotice pn, HttpSession session) throws IOException {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		Member loginUser = (Member) session.getAttribute("loginUser");
		pn.setBoardWriter(loginUser.getMemberNo());

		int result = projectService.insertProjectNotice(pn);

		if (result > 0) {
			session.setAttribute("alertMsg", "프로젝트 공지가 등록되었습니다");
			return "redirect:project?projectNo=" + pn.getProjectNo();
		} else {
			session.setAttribute("errorMsg", "다시 작성해주세요.");
			return "common/errorPage";
		}
	}

	// 프로젝트 상세 : 공지 조회(상세보기)
	@RequestMapping("project.noticeDetail")
	public String noticeDetail(ProjectNotice pn, Model model, HttpSession session) {

		// 로그인이 안되어있을 경우 로그인페이지로 이동
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		Member loginUser = (Member) session.getAttribute("loginUser");

		ProjectNotice item = projectService.selectProjectNoticeOne(pn);
		
		item.setCount(item.getCount() + 1);
		projectService.updateProjectNotice(item);

		Member m = new Member(); // 로그인 유저=업무글쓴사람 세팅
		m.setMemberNo(item.getBoardWriter());

		Project param = new Project(); // 해당 프로젝트번호 세팅
		param.setProjectNo(item.getProjectNo());

		// 프로젝트 상세내용 가져오기
		Project p = projectService.selectProjectDetailList(param);
		boolean isAdmin = false; // 글쓴이여부
		
		if ("99999".equals(loginUser.getMemberNo())) {
			// 세션에서 가져온 member No가 글쓴이인 경우
			isAdmin = true;
		}

		// 전부 다 넘기기
		model.addAttribute("p", p);
		model.addAttribute("item", item);
		model.addAttribute("isAdmin", isAdmin);

		return "project/noticePro/noticeProDetailView";
	}

	// 프로젝트 상세: 공지 게시판 리스트 가져오기
	@RequestMapping("noticeList.pro")
	public ModelAndView selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv,
			ProjectNotice pn) {

		int listCount = projectService.increasePrjectNoticeCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		
		List<ProjectNotice> list = projectService.selectProjectNoticeList(pn);
		mv.addObject("list", list).setViewName("project/noticePro/noticeProListView");

		return mv;

	}

	// 프로젝트 상세 : 공지 수정 or 삭제
	@ResponseBody
	@RequestMapping(value="noticeUD.pro", method=RequestMethod.POST)
	public String projectNoticeUpdateOrDelete(HttpSession session, @RequestBody Map<String, String> params) {
		String response = "";

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/";
		}

		String boardNo = "";
		String content = "";
		String title = "";

		String boardWriter = loginUser.getMemberNo();
		String type = "";

		type = params.get("type");
		boardNo = params.get("boardNo");
		content = params.get("content");
		title = params.get("title");

		ProjectNotice pn = new ProjectNotice();
		pn.setBoardNo(Integer.parseInt(boardNo));
		pn.setBoardContent(content);
		pn.setBoardTitle(title);
		pn.setBoardWriter(boardWriter);

		if (type.toUpperCase().equals("UPDATE")) {
			projectService.updateProjectNotice(pn);
		} else if (type.toUpperCase().equals("DELETE")) {
			projectService.deleteProjectNotice(pn);
		}
		return new Gson().toJson(response).toString();
	}

}
