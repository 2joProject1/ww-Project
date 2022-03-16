package com.kh.walkwork.member.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Cert;
import com.kh.walkwork.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; //비밀번호 암호화
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender sender; //이메일전송
	
	
	
// 회원가입창으로 이동	
	@RequestMapping("enroll.me")
	public String selectNoticeList(){
		
		return "member/enrollForm";
	}

	
	
//	회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		System.out.println(m);

		String str = m.getAddress();
		String[] strArr = str.split(",", 3);
		
		String address = strArr[0]+strArr[1]+strArr[2];
		System.out.println(address);
		
		//암호화 작업(암호문을 만들어내는 과정) 
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
//		System.out.println("암호문 : " + encPwd);
		
		System.out.println(encPwd);
		m.setMemberPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) { //성공=>메인페이지url 재요청
			
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다");
			return "redirect:/";
			
		} else { //실패=> 에러문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원가입 실패");
			// /WEB-INF/views		common/errorPage			.jsp
			return "index";
		}
		
	}
	
//	 인증번호전송(메일 내용 수정 / return값 수정 필요)
	@ResponseBody
	@RequestMapping(value="email.chk", produces="application/json; charset=utf-8")
	public String emailInput(String email, HttpServletRequest request) throws MessagingException {
		String ip = request.getRemoteAddr();
		String secret = memberService.sendMail(ip);
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setTo(email);
		helper.setSubject("인증하섿요");
		helper.setText("인증번호 : " + secret);
		
		sender.send(message);
		System.out.println("인증번호전송성공");
		return secret;
	}
	
//	인증번호 일치여부 확인(return값 수정 필요)
	@ResponseBody
	@RequestMapping(value="emailVali.chk", produces="application/json; charset=utf-8")
	public int valiCheck(String emailVali, HttpServletRequest request) {
		System.out.println("인증번호일치확인하러옴?");
		
		System.out.println(request.getRemoteAddr());
		System.out.println(emailVali);

		
		int result = memberService.valiCheck(Cert.builder().ipInfo(request.getRemoteAddr()).veriCode(emailVali).build());
		System.out.println(result);
		return result; 
	}
	
//	이메일 중복체크
	@ResponseBody
	@RequestMapping(value="emailDupl.chk", produces="application/json; charset=utf-8")
	public int emailDuplicationCheck(String emailDupl) {
		System.out.println("이메일중복체크하러넘어옴?");
		System.out.println(emailDupl);
		
		int result = memberService.emailDuplicationCheck(emailDupl);
		
		if(result > 0) {
			System.out.println("중복아이디있음");
		} else {
			System.out.println("이메일중복체크실패or중복없음");
		}
		
		
		return result; //수정하라고
	}
	
//	아이디 중복체크
	@ResponseBody
	@RequestMapping(value="idDupl.chk", produces="application/json; charset=utf-8")
	public int idDuplicationCheck(String id) {
		System.out.println("아이디중복체크하러넘어옴?");
		System.out.println(id);
		
		int result = memberService.idDuplicationCheck(id);
		
		if(result > 0) {
			System.out.println("아이디중복체크성공");
		} else {
			System.out.println("아이디중복체크실패or중복없음");
		}
		
		
		return result; //수정하라고
	}
	
}
