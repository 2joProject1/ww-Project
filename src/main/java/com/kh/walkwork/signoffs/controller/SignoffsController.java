package com.kh.walkwork.signoffs.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.walkwork.common.model.service.AttachmentService;
import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.signoffs.model.service.DocumentService;
import com.kh.walkwork.signoffs.model.service.SignoffsService;
import com.kh.walkwork.signoffs.model.vo.Document;
import com.kh.walkwork.signoffs.model.vo.Signoffs;
import com.kh.walkwork.signoffs.model.vo.SignoffsDept;

@Controller
public class SignoffsController {
	
	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private SignoffsService signoffsService;
	
	@Autowired
	private MemberService memberService;

	//문서상세보기
	@RequestMapping("docubox.detail")
	public String docuboxDetail(@ModelAttribute Document d, Model model, HttpSession session) {
		
		// 로그인이 안되어있을 경우 로그인페이지로 이동
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		boolean isReceiver = false; //"결재대상자 아님" 를 기본값으로
		System.out.println(d.getApprovalNo()+"approvalNo");
		Document documentItem = documentService.getDocumentOne(d);
		
		Signoffs receiverSignoffs = null; //결재대상자
		Signoffs s = new Signoffs();
		s.setDocuNo(d.getDocuNo()); //문서번호

		
		List<Signoffs> signoffsList = signoffsService.selectSignoffsList(s); //결재대상자리스트
		for (int i=signoffsList.size() - 1; i>=0; i--) {
			String approverNo = signoffsList.get(i).getApprover(); //결재대상자들 리스트에서 결재대상자 가져오기
			if (loginUser.getMemberNo().equals(approverNo) && signoffsList.get(i).getApprovalStatus() == 0) { //로그인유저의 사원번호와 결재대상자가 같으면, 결재상태가 0번이면
				isReceiver = true; //해당 결재대상자 true로 전환
				receiverSignoffs = signoffsList.get(i);
				break;
			} else if (signoffsList.get(i).getApprovalStatus() == 0){ //결재대상자들의 결재상태가 대기일 경우
				break;
			}
		}
		
		//수신부서 지정하기
		Dept dept = signoffsService.getSignoffsDept(d.getDocuNo());
		
		String drafter = documentItem.getDrafter();
		Member m = new Member();
		m.setMemberNo(drafter);
		
		Member writerInfo = memberService.loginMember(m);
		Dept writerDept = signoffsService.getDept(writerInfo.getDeptNo());
		
		Attachment a = new Attachment();
		a.setDocuNo(documentItem.getDocuNo());
		List<Attachment> fileList = attachmentService.selectAttachmentList(a);

		model.addAttribute("documentItem", documentItem);
		model.addAttribute("signoffsList", signoffsList);
		model.addAttribute("writerInfo", writerInfo);
		model.addAttribute("writerDept", writerDept);
		model.addAttribute("dept", dept);
		model.addAttribute("fileList", fileList);
		model.addAttribute("isReceiver", isReceiver);
		model.addAttribute("receiverSignoffs", receiverSignoffs);

		return "signoffs/documentDetailView";
	}
	
	//문서작성 - 문서형식 기안문서/품의서 나누기(format 1 == 기안문서, format 2 == 품의서)
	@RequestMapping("signoffs.docu")
	public String docuEnrollForm(HttpServletRequest request, HttpSession session, Model model) {
		// 로그인 세션에서 로그인 유저 GET
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		Dept writerDept = signoffsService.getDept(loginUser.getDeptNo());

		String format = request.getParameter("format");

		model.addAttribute("writerDept", writerDept);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("format", format);

		return "signoffs/documentsEnrollForm";
	}

	// 기안문서함
	@RequestMapping("docubox.draft")
	public String draftDocuBox(Document d, @RequestParam(value = "cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		d.setDrafter(loginUser.getMemberNo());
		
		int listCount = documentService.selectDocumentCount(d);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		List<Document> documentList = documentService.getDocumentList(d, pi);
		for (int i=0; i<documentList.size(); i++) {
			Attachment a = new Attachment();
			a.setDocuNo(documentList.get(i).getDocuNo());
			List<Attachment> fileList = attachmentService.selectAttachmentList(a);
			documentList.get(i).setFileYn(fileList.size() > 0 ? "Y" : "N");
		}

		model.addAttribute("documentList", documentList);
		model.addAttribute("pi", pi);
		model.addAttribute("viewType", "DRAFT");
		model.addAttribute("d", d);
		
		return "signoffs/draftDocuBox";
	}

	//수신문서함
	@RequestMapping("docubox.receive")
	public String receiveDocuBox(Document d, @RequestParam(value = "cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		d.setApprover(loginUser.getMemberNo());
		d.setSelectType(1);
		int listCount = documentService.selectDocumentCount(d);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		List<Document> documentList = documentService.getDocumentList(d, pi);
		
		model.addAttribute("documentList", documentList);
		model.addAttribute("pi", pi);
		model.addAttribute("viewType", "RECEIVE");
		model.addAttribute("d", d);
		
		return "signoffs/draftDocuBox";
	}
	
	//부서문서함
	@RequestMapping("docubox.dept")
	public String deptDocuBox(Document d, @RequestParam(value = "cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		d.setSignoffsDeptNo(loginUser.getDeptNo());
		int listCount = documentService.selectDocumentCount(d);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		List<Document> documentList = documentService.getDocumentList(d, pi);
		
		model.addAttribute("documentList", documentList);
		model.addAttribute("pi", pi);
		model.addAttribute("viewType", "DEPT");
		model.addAttribute("d", d);
		
		return "signoffs/draftDocuBox";
	}
	
	//결재승인
	@ResponseBody
	@RequestMapping("docubox.approve")
	public String approveSignoffs(Signoffs s, HttpSession session) {
		// 지금 요청하는 결재번호 승인 (만약에 지금 요청하는 Signoffs가 마지막 결재순번(approval Rank)이면? Document도 상태를 바꿔야 할려나?)

		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		Date now = new Date();

		s.setApprover(loginUser.getMemberNo());
		s.setApprovalStatus(1);
		s.setApprovalDate(now);
		
		// 결재 승인처리
		int result = signoffsService.updateSignoffs(s);
		
		Document vo = new Document();
		vo.setApprovalNo(s.getApprovalNo());
		Document d = documentService.getDocumentOne(vo);
		// 문서번호 Get
		
		s.setDocuNo(d.getDocuNo());
		// 해당 문서의 마지막 결재순번 구해오기
		String latestApprovalRank = signoffsService.getLatestApprovalNo(s);
		
		// 현재 결재승인할 대상의 정보 가져오기
		Signoffs item = signoffsService.selectSignoffsOne(s);
		
		// 마지막 결재순번인 경우 문서(Document) 결재 상태를 1(완료)로 업데이트 처리
		if (item.getApprovalRank().equals(latestApprovalRank)) {
			d.setApprovalDecision("1");
			documentService.updateDocument(d);
		}

		return result > 0 ? "Y" : "N";
	}

	@RequestMapping("docubox.reject")
	public String rejectDocuBox(Document d, @RequestParam(value = "cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		d.setDrafter(loginUser.getMemberNo());
		d.setSelectType(2);
		
		int listCount = documentService.selectDocumentCount(d);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		List<Document> documentList = documentService.getDocumentList(d, pi);

		model.addAttribute("documentList", documentList);
		model.addAttribute("pi", pi);
		model.addAttribute("viewType", "REJECT");
		model.addAttribute("d", d);
		
		return "signoffs/draftDocuBox";
	}
	
	//결재반려
	@ResponseBody
	@RequestMapping("docubox.deny")
	public String denySignoffs(Signoffs s, HttpSession session) {
		// TODO - 지금 요청하는 결재번호 반려 및 Document도 반려.

		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");
		Date now = new Date();

		s.setApprover(loginUser.getMemberNo());
		s.setApprovalStatus(2);
		s.setApprovalRejectDate(now);
		
		int result = signoffsService.updateSignoffs(s);
		
		
		Document vo = new Document();
		vo.setApprovalNo(s.getApprovalNo());
		Document d = documentService.getDocumentOne(vo);
		d.setApprovalDecision("2");
		documentService.updateDocument(d);

		return result > 0 ? "Y" : "N";
	}
	
	// 문서 기안 - 데이터 넘기기
	@RequestMapping("docubox.insert")
	public String insertBoard(@ModelAttribute Document d, HttpSession session, Model model,MultipartHttpServletRequest mhsr) throws IOException {
		// @ModelAttribute : 가시성을 위해 쓸 수 있음(안써도됨)

		if (session.getAttribute("loginUser") == null) {
			// 로그인이 안되어있을 경우 로그인페이지로 이동
			return "redirect:/";
		}
		// 로그인 세션에서 로그인 유저 GET
		Member loginUser = (Member) session.getAttribute("loginUser");

		String lastDocuNo = documentService.getLastDocuNo(); //문서번호
		String[] signoffs = d.getSignoffs().split(","); //결재자들
		String signoffsDeptNo = d.getSignoffsDeptNo();
		
		Date now = new Date();
		String currentDate = new SimpleDateFormat("yyyyMMdd").format(now);
		
		if (lastDocuNo == null) {
			lastDocuNo = "000";
		}

		String[] splitData = lastDocuNo.split("-");
		String lastData = splitData[splitData.length - 1];
		int lastVal = Integer.parseInt(lastData); 
		int nextVal = lastVal + 1;
		String currentDocuNo = currentDate + "-"+ d.getDocuFormat() + "-" + String.format("%03d", nextVal);
		d.setDocuNo(currentDocuNo);
		d.setDocuRetentionPeriod("5년");
		d.setDocuWriteDate(now);
		d.setDrafter(loginUser.getMemberNo()); // 사원번호
		
		int result = documentService.insertDocument(d);
		
		if (signoffsDeptNo != null && !signoffsDeptNo.equals("0") && !signoffsDeptNo.equals("")) {
			// 수신부서번호가 빈값이 아닐 때
			SignoffsDept sd = new SignoffsDept();
			sd.setDeptNo(signoffsDeptNo);
			sd.setDocuDate(currentDate);
			sd.setDocuNo(currentDocuNo);
			signoffsService.insertSignoffsDept(sd);
		}

		int approvalRank = 2;
		for (String item : signoffs) {
			//팀장, 차장꺼
			Signoffs vo = new Signoffs();
			vo.setDocuNo(currentDocuNo);
			vo.setApprover(item);
			vo.setDocuDate(currentDate);
			vo.setApprovalStatus(0);
			vo.setApprovalRank(String.valueOf(approvalRank));
			signoffsService.insertSignoffs(vo);
			approvalRank++;
		}

		if (result > 0) {
			String docuNo = d.getDocuNo();
			List<MultipartFile> files = mhsr.getFiles("attachment");
			if (files != null) {
				for (MultipartFile reupfile : files) {
					// 새로 첨부파일해서 업로드
					if (!"".equals(reupfile.getOriginalFilename())) {
						// 새로 넘어온 첨부파일 서버 업로드시키기
						// saveFile 메서드를 통해 현재 넘어온 첨부파일을 서버에 저장시키자
						long size = reupfile.getSize();
						String changeName = saveFile(reupfile, session);
						String originName = reupfile.getOriginalFilename(); // 원본명
						changeName = "resources/uploadFiles/" + changeName;
						
						Attachment a = new Attachment();
						a.setFileName(changeName);
						a.setFileOriginName(originName);
						a.setFilePath(" ");
						a.setFileSize(String.valueOf(size));
						a.setFileUploadDate(now);
						a.setDocuNo(docuNo);
						a.setMemberNo("");
						a.setBoardNo(0);
						attachmentService.insertAttachment(a);
					}
				}
			}
		}

//		if (result > 0) {
//			session.setAttribute("alertMsg", "게시글을 수정하였습니다");
//			return "redirect:detail.bo?bno=" + b.getBoardNo();
//		} else {
//			model.addAttribute("errorMsg", "게시글 수정에 실패하였습니다");
//			return "common/errorPage";
//		}
		/*
		 * b에 boardNo, boardTitle, boardContent 이 3개는 무조건 들어가있음(b객체에)
		 * 
		 * 1. 새로 첨부된파일x, 기존 첨부파일x => originName : null, changeName : null 2. 새로 첨부된파일x,
		 * 기존 첨부파일 o => originName : 기존 첨부파일의 이름, changeName : 기존 첨부파일의 경로 3. 새로 첨부된파일o,
		 * 기존 첨부파일x => originName : 새로 첨부된 파일의 이름. changeName : 새로 첨부된파일의 경로 4. 새로
		 * 첨부된파일o, 기존 첨부파일o => originName : 기존 첨부된 파일의 이름, changeName : 새로 첨부된 파일의 경로
		 * 
		 * 
		 */
//		session.setAttribute("alertMsg", "게시글을 수정하였습니다");
//		return "redirect:detail.bo?bno=" + b.getBoardNo();
		return "redirect:docubox.detail?docuNo=" + currentDocuNo;
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {
		// 실제 넘어온파일을 이름을 변경해서 서버에 업로드하는 역할만 함 =>
		// 첨부파일이있을때만 호출

		// 파일 명 수정작업 후 서버에 업로드 시키기("bono.png" => "2022022115374012135.png")
		String originName = upfile.getOriginalFilename(); // 첨부파일의 원본명("bono.png")

		// "20220221153740"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 13232(5자리 랜덤값)
		int ranNum = (int) (Math.random() * 90000) + 10000; // 확장자
		String ext = originName.substring(originName.lastIndexOf(".")); // 끝에서부터 . 뒤로 전부

		// 변경한파일명(년월일시분초형식)
		String changeName = currentTime + ranNum + ext; // asd.jpg -> 2022020212121210000.jpg

		// 업로드시키고자 하는 물리적인 경로 알아내기(getRealPath) 경로뒤에 반드시 / 슬래시
		// 붙여야한다("/resources/uploadFiles / <=이거 반드시 ")
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
}
