package com.kh.walkwork.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.kh.walkwork.email.model.service.EmailService.EmailForm;

@Controller
public class EmailController {

	
	@Autowired
    private EmailSender emailSender;
 

	
	/*
	@RequestMapping("email.bo")
	public String emailMain() {
		return "email/emailMain";
	}
	*/
	
	@RequestMapping("email.form")
	public String emailForm() {
		return "email/emailForm";
	}
	
	
	@RequestMapping(value="send",method=RequestMethod.GET)
    public String formback() {
        return "mailForm";
    }
    
    
    @RequestMapping(value="send",method=RequestMethod.POST)
    public String submit(EmailForm form) throws Exception{
        emailSender.sendEmail(form);
        return "emailSuccess";
    }


    
}
