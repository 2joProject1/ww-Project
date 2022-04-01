package com.kh.walkwork.project.task.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.walkwork.common.model.service.AttachmentService;
import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.Reply;
import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.project.common.model.service.ProjectService;
import com.kh.walkwork.project.common.model.vo.Project;
import com.kh.walkwork.project.common.model.vo.ProjectMember;
import com.kh.walkwork.project.task.model.service.TaskService;
import com.kh.walkwork.project.task.model.vo.Task;

@Controller
public class TaskController {

	@Autowired
	private TaskService taskService;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private MemberService memberService;

	// 업무 작성
	@RequestMapping("insert.task")
	public String insertTask(Task t, MultipartHttpServletRequest mhsr, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		Member loginUser = (Member) session.getAttribute("loginUser");
		t.setBoardWriter(loginUser.getMemberNo());

		int result = taskService.insertTask(t);
		List<MultipartFile> upfile = mhsr.getFiles("attachment");

		if (upfile != null) {

			for (int i = 0; i < upfile.size(); i++) {
				if (!upfile.get(i).getOriginalFilename().equals("")) {
					MultipartFile file = upfile.get(i);
					System.out.println(upfile.get(i).getOriginalFilename());
					String originName = upfile.get(i).getOriginalFilename();
					String changeName = saveFile(file, session);

					long fileSize = file.getSize();

					Attachment a = new Attachment();

					a.setFileName(changeName);
					a.setBoardNo(t.getBoardNo());
					a.setMemberNo(t.getBoardWriter());
					a.setFileOriginName(originName);
					a.setFilePath("resources/uploadFiles/");
					a.setFileSize(String.valueOf(fileSize));
					int success = attachmentService.insertNoticeAttachment(a);

				}
			}

		}

		if (result > 0) {
			session.setAttribute("alertMsg", "업무가 작성되었습니다");
			return "redirect:project.taskDetail?boardNo=" + t.getBoardNo();
		} else {
			session.setAttribute("errorMsg", "업무가 작성되지 않았습니다. 다시 이용해주세요.");
			return "common/errorPage";
		}
	}

	// 업무 수정
	@RequestMapping("update.task")
	public String updateTask(Task t, MultipartHttpServletRequest mhsr, HttpSession session) {
		
		// 로그인이 안되어있을 경우 로그인페이지로 이동
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}

		int result = taskService.updateTask(t);
		List<MultipartFile> upfile = mhsr.getFiles("attachment");
		
		//파일 수정
		if (upfile != null) {

			for (int i = 0; i < upfile.size(); i++) {
				if (!upfile.get(i).getOriginalFilename().equals("")) {
					MultipartFile file = upfile.get(i);
					String originName = upfile.get(i).getOriginalFilename(); //원래 파일명
					String changeName = saveFile(file, session); //변경된 파일명

					long fileSize = file.getSize(); //파일크기

					Attachment a = new Attachment();

					a.setFileName(changeName);
					a.setBoardNo(t.getBoardNo());
					a.setMemberNo(t.getBoardWriter());
					a.setFileOriginName(originName);
					a.setFilePath("resources/uploadFiles/");
					a.setFileSize(String.valueOf(fileSize));
					
					int success = attachmentService.insertNoticeAttachment(a);

				}
			}

		}

		if (result > 0) {
			session.setAttribute("alertMsg", "업무 내용이 수정되었습니다");
			return "redirect:project.taskDetail?boardNo=" + t.getBoardNo();
		} else {
			session.setAttribute("errorMsg", "업무 내용이 수정되지 않았습니다. 다시 이용해주세요.");
			return "common/errorPage";
		}
	}
	
	//첨부파일
	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));

		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

	// 업무 작성 : 담당 대상자 리스트
	@ResponseBody
	@RequestMapping("handler.task")
	public List<ProjectMember> taskHandlerList(Project p) {
		List<ProjectMember> projectMemberList = projectService.getProjectMemberList(p);
		return projectMemberList;
	}

	// 업무 작성 : 담당 대상자 리스트
	@ResponseBody
	@RequestMapping("project.taskList")
	public List<Task> taskList(Task t, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return new ArrayList<>();
		}
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		t.setBoardWriter(loginUser.getMemberNo());
		t.setTaskHandler(loginUser.getMemberNo());
		List<Task> taskList = taskService.getTaskListByFilter(t);
		return taskList;
	}

	// 업무 : 상세보기 + 수정하기
	@RequestMapping("project.taskDetail")
	public String taskDetail(Task t, Model model, HttpSession session) {

		// 로그인이 안되어있을 경우 로그인페이지로 이동
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		Task item = taskService.getTaskDetail(t); //업무 상세 내용 가지고오기
		Attachment a = new Attachment(); //첨부파일
		a.setBoardNo(item.getBoardNo()); //해당 게시글번호
		
		//첨부파일리스트 가져오기
		List<Attachment> fileList = attachmentService.selectAttachmentList(a);
		
		Member m = new Member(); //로그인 유저=업무글쓴사람 세팅
		m.setMemberNo(item.getBoardWriter()); 
		Member writerInfo = memberService.loginMember(m); 
		
		Project param = new Project(); //해당 프로젝트번호 세팅
		param.setProjectNo(item.getProjectNo());
		
		//프로젝트 상세내용 가져오기
		Project p = projectService.selectProjectDetailList(param);
		
		//업무댓글리스트 가져오기
		List<Reply> taskReplyList = taskService.getTaskReplyList(t);
		
		//전부 다 넘기기
		model.addAttribute("p", p);
		model.addAttribute("item", item);
		model.addAttribute("fileList", fileList);
		model.addAttribute("writerInfo", writerInfo);
		model.addAttribute("taskReplyList", taskReplyList);
		return "project/task/projectTaskDetailView";
	}

	// 업무 : 댓글 달기
	@ResponseBody
	@RequestMapping(value = "insert.reply")
	public String insertReplyList(Reply r, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		r.setMemberNo(loginUser.getMemberNo());
		r.setFile(loginUser.getFile());
		return taskService.insertReplyList(r) > 0 ? "success" : "fail";
	}
	
	// 업무 : 댓글 가져오기
	@ResponseBody
	@RequestMapping(value = "selectReply.task", produces = "application/json; charset=UTF-8")
	public String getTaskReplyList(Task t) {
		return new Gson().toJson(taskService.getTaskReplyList(t)).toString();
	}

	// 업무 : 댓글 삭제하기
	@ResponseBody
	@RequestMapping(value = "deleteReply.task", produces = "application/json; charset=UTF-8")
	public String deleteTaskReplyList(Reply r) {
		return new Gson().toJson(taskService.deleteTaskReplyList(r)).toString();
	}
	
	//프로젝트 업무 차트
	@ResponseBody
	@RequestMapping(value="/project/tstatereport")
	public List<Integer> tstateReport(ModelAndView mv, @RequestParam(name = "projectNo") int projectNo) {
		List<Integer> slist = new ArrayList<Integer>();
		try {
			Task t = new Task();
			t.setProjectNo(projectNo);
			t.setTaskStatus(1);
			int value = taskService.taskStateList(t);
			t.setTaskStatus(2);
			int value2 = taskService.taskStateList(t);
			t.setTaskStatus(3);
			int value3 = taskService.taskStateList(t);
			slist.add(value);
			slist.add(value2);
			slist.add(value3);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return slist;
	}
}
