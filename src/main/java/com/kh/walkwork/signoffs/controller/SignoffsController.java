package com.kh.walkwork.signoffs.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.walkwork.common.model.service.AttachmentService;
import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.signoffs.model.service.DocumentService;
import com.kh.walkwork.signoffs.model.service.SignoffsService;
import com.kh.walkwork.signoffs.model.vo.Document;
import com.kh.walkwork.signoffs.model.vo.Signoffs;

@Controller
public class SignoffsController {
	
	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private SignoffsService signoffsService;

	//문서상세보기
	@RequestMapping("docubox.detail")
	public String docuboxDetail(@ModelAttribute Document d, Model model) {
		Document documentItem = documentService.getDocumentOne(d);
		Signoffs s = new Signoffs();
		s.setDocuNo(d.getDocuNo());
		List<Signoffs> signoffsList = signoffsService.selectSignoffsList(s);

		model.addAttribute("documentItem", documentItem);
		model.addAttribute("signoffsList", signoffsList);

		return "signoffs/documentDetailView";
	}
	
	//문서작성 - 기안문서/품의서 나누기(format 1 == 기안문서, format 2 == 품의서)
	@RequestMapping("signoffs.docu")
	public String docuEnrollForm(HttpServletRequest request) {
		String format = request.getParameter("format");

		if ("1".equals(format)) {
			return "signoffs/documentsEnrollForm";
		} else if ("2".equals(format)) {
			return "signoffs/documentsEnrollForm2";
		} else {
			return "signoffs/documentsEnrollForm";
		}
	}

	// 기안문서함
	@RequestMapping("docubox.draft")
	public String draftDocuBox(@RequestParam(value = "cpage", defaultValue="1") int currentPage, Model model) {

		Document d = new Document();

		
		int listCount = documentService.selectDocumentCount(d);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		List<Document> documentList = documentService.getDocumentList(d, pi);
		
		model.addAttribute("documentList", documentList);
		
		return "signoffs/draftDocuBox";
	}

	//수신문서함
	@RequestMapping("docubox.reseive")
	public String reseiveDocuBox() {
		return "signoffs/reseiveDocuBox";
	}
	
	//부서문서함
	@RequestMapping("docubox.dept")
	public String deptDocuBox() {
		return "signoffs/deptDocuBox";
	}
	
	//반려문서함
	@RequestMapping("docubox.reject")
	public String rejectDocuBox() {
		return "signoffs/rejectDocuBox";
	}
	
	// 문서 기안 - 데이터 넘기기
	@RequestMapping("docubox.insert")
	public String insertBoard(@ModelAttribute Document d, HttpSession session, Model model,MultipartHttpServletRequest mhsr) throws IOException {
		// @ModelAttribute : 가시성을 위해 쓸 수 있음(안써도됨)

		String nextDocuNo = documentService.getLastDocuNo(); //문서번호
		String[] signoffs = d.getSignoffs().split(","); //결재자들
		
		
		if (nextDocuNo == null) {
			nextDocuNo = "000";
		}
		
		String[] splitData = nextDocuNo.split("-");
		String lastData = splitData[splitData.length - 1];
		int lastVal = Integer.parseInt(lastData); 
		int nextVal = lastVal + 1;
		String currentDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String nextDocNo = currentDate + "-"+ d.getDocuFormat() + "-" + String.format("%03d", nextVal);
		d.setDocuNo(nextDocNo);
		d.setDocuRetentionPeriod("5년");
		d.setDocuWriteDate(new Date());
		d.setDrafter("11111"); // 사원번호 - 추후 세션으로 대체
		
		int result = documentService.insertDocument(d);

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
						a.setFileUploadDate(new Date());
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
		return "signoffs/documentDetailView";
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
