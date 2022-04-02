package com.kh.walkwork.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.service.AttachmentService;
import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.notice.model.service.NoticeService;
import com.kh.walkwork.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private AttachmentService attachmentService;

	//공지조회로 이동
	@RequestMapping("notice.no")
	public ModelAndView selectNoticeList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = noticeService.selectNoticeListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 12);
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		mv.addObject("pi", pi).addObject("list", list);
		
		ArrayList<Notice> topList = noticeService.selectTopList();
		mv.addObject("topList", topList);
		
		mv.setViewName("notice/noticeListView");
		
		
		return mv;
	}
	
	
	//공지상세조회
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(ModelAndView mv, int bno, String mno, Notice n){
		
		n.setBoardNo(bno);
		n.setBoardWriter(mno);
		
		int result = noticeService.increaseCount(bno);

		
		if(result > 0) {
			Notice rn = noticeService.selectNotice(n);
			ArrayList<Attachment> file = noticeService.selectFile(n);
				if(!file.isEmpty()) {
					mv.addObject("file", file);
				} 

			mv.addObject("rn", rn).setViewName("notice/noticeDetailView");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회실패").setViewName("common/errorPage");
			return mv;
		}

	}
	
	
	//공지작성폼으로 이동
	@RequestMapping("enrollForm.no")
	public String noticeEnrollForm(){
		
		return "notice/noticeInsertView";
	}
	

	//공지 작성
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, MultipartFile[] upfile, HttpSession session) throws IOException {

		Notice b = noticeService.insertNotice(n);
		

		if(upfile!=null) {
			
			for(int i = 0; i<upfile.length; i++) {
				if(!upfile[i].getOriginalFilename().equals("")) {	//getOriginalFilename() == filename필드의 값을 반환함
					MultipartFile file = upfile[i];

					String originName = upfile[i].getOriginalFilename();
					String changeName = saveFile(file, session);
					
					long fileSize = file.getSize();
					
					Attachment a = new Attachment();

					a.setFileName(changeName);
					a.setBoardNo(b.getBoardNo());
					a.setMemberNo(b.getBoardWriter());
					a.setFileOriginName(originName);
					a.setFilePath("resources/uploadFiles/");
					
					a.setFileSize(String.valueOf(fileSize)); //getSize해서 나오는 결과값이 long형이라 String으로 변경
					int success = attachmentService.insertNoticeAttachment(a);
				}
			}

		}
		return "redirect:notice.no"; 
		
		
	}
	
	//공지 업데이트창으로 이동
	@RequestMapping("updateForm.no")
	public ModelAndView updateForm(int bno, String mno, Notice n, ModelAndView mv) {
		n.setBoardNo(bno);
		n.setBoardWriter(mno);
		Notice b = noticeService.selectNotice(n);
		ArrayList<Attachment> a = noticeService.selectFile(b);
		
		
		mv.addObject("b", b).addObject("a", a).setViewName("notice/noticeUpdateView");
		

		return mv;
	}
	
	//공지업뎃
	@RequestMapping("update.no")
	public String updateNotice(Notice n, Attachment a, MultipartFile[] reupfile, HttpSession session){
		int result = noticeService.updateNotice(n);
		
		int fileLength = reupfile.length;
		int boardNo = n.getBoardNo();
		if(reupfile.length>0) { //업로드된 갯수만큼 파일 삭제
			int result1 = noticeService.selectAttachCount(n.getBoardNo());
			int deleteResult = noticeService.deleteFile(fileLength, boardNo);
		}
		
		
		if(reupfile!=null) {
			
			for(int i = 0; i<reupfile.length; i++) {
				if(!reupfile[i].getOriginalFilename().equals("")) {	//getOriginalFilename() == filename필드의 값을 반환함
					MultipartFile file = reupfile[i];

					String originName = reupfile[i].getOriginalFilename();
					String changeName = saveFile(file, session);
					
					long fileSize = file.getSize();
					

					a.setFileName(changeName);
					a.setBoardNo(n.getBoardNo());
					a.setMemberNo(n.getBoardWriter());
					a.setFileOriginName(originName);
					a.setFilePath("resources/uploadFiles/");
					
					a.setFileSize(String.valueOf(fileSize)); //getSize해서 나오는 결과값이 long형이라 String으로 변경
					int success = attachmentService.insertNoticeAttachment(a);
				}
			}
		}
		return "redirect:notice.no";
	}
	
	
	//게시글완전삭제
	@RequestMapping("delete.no")
	public String deleteNotice(int bno, String mno, Notice n) {
		n.setBoardWriter(mno);
		n.setBoardNo(bno);
		
		int result = noticeService.deleteNotice(n);

		return "redirect:notice.no";
	}
	
	//부서별 공지 조회
	@RequestMapping("range.no")
	public ModelAndView rangeNotice(@RequestParam(value = "cpage", defaultValue = "1")int currentPage, ModelAndView mv, String noticeRange) {
		int listCount = noticeService.selectRangeListCount(noticeRange);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 12);
		ArrayList<Notice> list = noticeService.rangeNotice(noticeRange, pi);
		mv.addObject("pi", pi).addObject("list", list).addObject("noticeRange", noticeRange);
		mv.setViewName("notice/noticeRangeView");
		return mv;
	}
	

	//파일관련
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

}
