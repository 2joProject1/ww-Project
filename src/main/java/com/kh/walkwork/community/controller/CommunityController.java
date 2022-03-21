package com.kh.walkwork.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.community.model.service.CommunityService;
import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.community.model.vo.Reply;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("write.co")
	public String writeCommunity() {
		return "community/communityWriteForm";
	}
	
	
	// 수정 페이지 이동
	@RequestMapping("modifyPage.co")
	public ModelAndView modifyPage(@RequestParam(value = "pageNo") int pageNo,ModelAndView mv) {
		
		Community detail = communityService.selectDetail(pageNo);
		ArrayList<Attachment> attachment = communityService.selectAttachmentDetail(pageNo);
		
		mv.addObject("detail", detail).addObject("attachment", attachment).setViewName("community/communityModify");
		
		return mv;
	}
	
	// 실제로 modify시키는거
	@RequestMapping("modify.co")
	public String modifyCommunity(Attachment a, Community c, Model model) {
		String[] nameArr = a.getFileName().split(",");
//		String[] memberArr = a.getMemberNo().split(",");
		String[] originArr = a.getFileOriginName().split(",");
		String[] pathArr = a.getFilePath().split(",");
		String[] sizeArr = a.getFileSize().split(",");

		int num = communityService.updateCommunity(c); 
		System.out.println("modify result >> "+num);
		
	
		a.setBoardNo(c.getBoardNo());
		  
		// 사진의 정보를 db에 넣어줌 :-)
		if(a.getFileName().length() != 0) {
			for(int i=0; i< originArr.length; i++) {
				Attachment attachment = new Attachment();
				attachment.setFileName(nameArr[i].trim());
				attachment.setBoardNo(c.getBoardNo());
				attachment.setMemberNo("임시");
				attachment.setFileOriginName(originArr[i].trim());
				attachment.setFilePath(pathArr[i].trim());
				attachment.setFileSize(sizeArr[i].trim());
				int num2 = communityService.insertAttachment(attachment);
				
			}
		}
		 

		return "redirect:list.co";
	}
	
	// 글 삭제
	@RequestMapping("delete.co")
	public String deleteCommunity(@RequestParam(value = "pageNo") int pageNo, Model model) {
		// 권한 내용
		
		int num = communityService.deleteCommunity(pageNo); 

		return "redirect:list.co";
	}

	// 글 가져오기
	@RequestMapping("list.co")
	public ModelAndView selectList(@RequestParam(value = "cpage", defaultValue="1") int currentPage, ModelAndView mv, @RequestParam(value = "search", required = false, defaultValue = "") String search) {
		
		int listCount = communityService.selectListCount(search);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		
		ArrayList<Community> list = communityService.selectList(pi, search);

		
		ArrayList<Community> top = communityService.selectTopCm();
		
		ArrayList<Attachment> topImages = communityService.selectViewAtt();
		
		
		mv.addObject("search", search).addObject("pi", pi).addObject("list", list).addObject("top", top).addObject("topImages",topImages).setViewName("community/communityView");

		return mv;
		
	}
	
	
	// 상세조회  
	@RequestMapping("detail.co")
	public ModelAndView detailCommunity(@RequestParam(value = "pageNo") int pageNo,ModelAndView mv) {
		
		
		Community detail = communityService.selectDetail(pageNo);
		ArrayList<Attachment> attachment = communityService.selectAttachmentDetail(pageNo);
		ArrayList<Reply> replys = communityService.selectReply(pageNo);
		
		mv.addObject("detail", detail).addObject("replys",replys).addObject("attachment", attachment).setViewName("community/communityDetail");
		
		return mv;
	}

	// 글 작성하기
	@RequestMapping("insert.co")
	public String insertCommunity(Attachment a, Community c, Model model) {
		String[] nameArr = a.getFileName().split(",");
//			String[] memberArr = a.getMemberNo().split(",");
		String[] originArr = a.getFileOriginName().split(",");
		String[] pathArr = a.getFilePath().split(",");
		String[] sizeArr = a.getFileSize().split(",");

		
		c.setBoardWriter("익명");  //임시 작성자 데이터 ! 나중에
//			삭제 후 실 member 데이터 사용 
		
		int num = communityService.insertCommunity(c); 
		int lastBno = communityService.lastBno();
		a.setBoardNo(lastBno);
		  
		// 사진의 정보를 db에 넣어줌 :-)
		if(a.getFileName().length() != 0) {
			for(int i=0; i< originArr.length; i++) {
				Attachment attachment = new Attachment();
				attachment.setFileName(nameArr[i].trim());
				attachment.setBoardNo(lastBno);
				attachment.setMemberNo("임시");
				attachment.setFileOriginName(originArr[i].trim());
				attachment.setFilePath(pathArr[i].trim());
				attachment.setFileSize(sizeArr[i].trim());
				int num2 = communityService.insertAttachment(attachment);
				
			}
		}
		 

		return "redirect:list.co";
	}
	
	// 파일 삽입하기
	@ResponseBody
	@RequestMapping("insert.ac")
	public List<Attachment> insertAttachment(HttpServletRequest req, HttpSession session,@RequestPart(value="file1", required=false) List<MultipartFile> multi ,Attachment a, Model model)  {
		String path = "C:\\walkworkFiles";
//			ServletContext context = req.getSession().getServletContext();
//			ClassPathResource cpr = new ClassPathResource("coFile/asdf.png");
//			InputStream is = cpr.getInputStream();
//			File file1 = File.createTempFile("asdf", ".png");
//			try {
//				FileUtils.copyInputStreamToFile(is, file1);
//			} catch (Exception e) {
//				System.out.println("dd");
//				e.printStackTrace();
//			}		
//			String path = session.getServletContext().getRealPath("/resources/coFile/");
		
		List<Attachment> result = new ArrayList<Attachment>();
		try {
			for(MultipartFile mf : multi) {
				String uploadpath = path;
				String originFileName = mf.getOriginalFilename();
				String extName = originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
				long size = mf.getSize();
				String saveFileName =  genSaveFileName(extName);
				File dir = new File(path);
				if(!dir.exists()) {
					dir.mkdir();
				}
				if(!multi.isEmpty()) {
					File file = new File(uploadpath, saveFileName);
					
	                mf.transferTo(file);
	                
	                Attachment attaachment = new Attachment();
	                attaachment.setFileName(saveFileName);
//		                attaachment.setBoardNo(lastBno);
	                attaachment.setFileOriginName(originFileName);
	                attaachment.setFilePath(path);
	                attaachment.setFileSize(Long.toString(size));
	                
	                result.add(attaachment);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("그림 없을때 ㅇㅇ");
		} 
		return result;
		
	}
	@ResponseBody
	@RequestMapping("delete.ac")
	public String deleteAttachment(HttpServletRequest req, HttpSession session, Attachment a, Model model)  {
		String result = "";
		System.out.println("del in");
		if(a.getFileName() != null) {
			System.out.println("del" + a.getFileName());
			String[] delArr = a.getFileName().split(",");
			int num = communityService.deleteAttachment(delArr);
		}
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("modify.ac")
	public List<Attachment> modifyAttachment(HttpServletRequest req, HttpSession session,@RequestPart(value="file1", required=false) List<MultipartFile> multi,@RequestParam(value = "bno") int bno, Model model)  {
		String path = "C:\\walkworkFiles";
		List<Attachment> result = new ArrayList<Attachment>();
		
		try {
			if(multi.size() > 0) {
				System.out.println("multi > 0");
				for(MultipartFile mf : multi) {
					String uploadpath = path;
					String originFileName = mf.getOriginalFilename();
					String extName = originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
					long size = mf.getSize();
					String saveFileName =  genSaveFileName(extName);
					File dir = new File(path);
					if(!dir.exists()) {
						dir.mkdir();
					}
					if(!multi.isEmpty()) {
						System.out.println("bno>>"+bno);
						File file = new File(uploadpath, saveFileName);
						
		                mf.transferTo(file);
		                
		                Attachment attaachment = new Attachment();
		                attaachment.setFileName(saveFileName);
			            attaachment.setBoardNo(bno);
		                attaachment.setFileOriginName(originFileName);
		                attaachment.setFilePath(path);
		                attaachment.setFileSize(Long.toString(size));
		                
		                result.add(attaachment);
					}
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("그림 없을때 ㅇㅇ");
		} 
		return result;
	}
	
	private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
	
	@RequestMapping("insertReply.co")
	public String insertReply(Reply r, Model model) {
		String result = "redirect:detail.co?pageNo=" + r.getBoardNo();
		r.setBoardNo(r.getBoardNo());
		r.setMemberNo("1");
		int num = communityService.insertReply(r);
		
		
		return result;
	}
	
	@RequestMapping("deleteReply.co")
	public String deleteReply(Reply r, Model model ) {
		String result = "redirect:detail.co?pageNo=" + r.getBoardNo();
		
		int num = communityService.deleteReply(r);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("thumbsPlus.co")
	public String thumbsPlus(Model model, Community c ) {
		String result = "";
		System.out.println("no >> "+c.getBoardNo());
		c.setCommunityGood(c.getCommunityGood()+1);
		int num = communityService.thumbsPlus(c);
		System.out.println("num >>" + num);
		if(num == 1) {
			result = "s";
		}else {
			result = "f";
		}
		
		return result;
	}
	@ResponseBody
	@RequestMapping("thumbsMinus.co")
	public String thumbsMinus(Model model, Community c ) {
		String result = "";
		c.setCommunityGood(c.getCommunityGood());
		int num = communityService.thumbsMinus(c);
		if(num == 1) {
			result = "s";
		}else {
			result = "f";
		}
		
		return result;
	}
	
}
