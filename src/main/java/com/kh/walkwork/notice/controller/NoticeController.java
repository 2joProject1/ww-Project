package com.kh.walkwork.notice.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
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





	@RequestMapping("notice.no")
	public ModelAndView selectNoticeList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = noticeService.selectNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		System.out.println(list.size());
		mv.addObject("pi", pi).addObject("list", list);
		mv.setViewName("notice/noticeListView");
		
		
		return mv;
	}
	
	
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(ModelAndView mv, int bno, String mno, Notice n){
		
//		System.out.println(mno);
		n.setBoardNo(bno);
		n.setBoardWriter(mno);
		
//		System.out.println(n);
		int result = noticeService.increaseCount(bno);
//		System.out.println(result);
		
		if(result > 0) {
			ArrayList<Notice> list = noticeService.selectNotice(n);
//			System.out.println("리스트머잇음"+list.isEmpty());
//			System.out.println(list.size());
			System.out.println(list.get(0));
			System.out.println(list.get(1));
			mv.addObject("list", list).setViewName("notice/noticeDetailView");
		} else {
			mv.addObject("errorMsg", "상세조회실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping("enrollForm.no")
	public String noticeEnrollForm(){
		
		return "notice/noticeInsertView";
	}
	

	@RequestMapping("insert.no")
	public String insertNotice(Notice n, MultipartFile[] upfile, HttpSession session) throws IOException {

		Notice b = noticeService.insertNotice(n);

		if(upfile!=null) {
			
			for(int i = 0; i<upfile.length; i++) {
				if(!upfile[i].getOriginalFilename().equals("")) {	//getOriginalFilename() == filename필드의 값을 반환함
					MultipartFile file = upfile[i];
					System.out.println(upfile[i].getOriginalFilename());
					String originName = upfile[i].getOriginalFilename();
					String changeName = saveFile(file, session);	// 얘가 이해가 안됨??
					 
					long fileSize = file.getSize();
					
					Attachment a = new Attachment(); //아 뉴 쓰지 ㅁ라랬는데 ㅠㅠ... 

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
	
	@RequestMapping("update.no")
	public String updateNotice(){
		
		return "notice/noticeUpdqteView";
	}
	

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
