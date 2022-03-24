package com.kh.walkwork.email.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//import com.kh.walkwork.email.model.service.EmailService.EmailForm;

@Controller
public class EmailController {

	
	@Autowired
	private JavaMailSender mailSender;
 

	@RequestMapping("email.form")
	public String emailForm() {
		return "email/emailForm";
	}
	
	@RequestMapping(value = "/mail/mailSending")
	  public String mailSending(HttpServletRequest request) {
	   
	    String setfrom = "2jo2jo2jo2jo2jo@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  
	      messageHelper.setTo(tomail);     
	      messageHelper.setSubject(title); 
	      messageHelper.setText(content);  
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/";
	  }

	/*
	@RequestMapping(value = "enrollajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> enrollStudent(MultipartHttpServletRequest multi) {
		
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/image";
		
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		Iterator<String> files = multi.getFileNames();
		
		while(files.hasNext()) {
			String uploadFile = files.next();
			
			MultipartFile mFile = multi.getFile(uploadFile);
			
			String fileName_original = mFile.getOriginalFilename();
			
			String file_save_path = "/src/main/webapp/resources/image/";
			
			try {
				mFile.transferTo(new File(file_save_path+fileName_original));
			
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return null;
		
	}
    */
	
}