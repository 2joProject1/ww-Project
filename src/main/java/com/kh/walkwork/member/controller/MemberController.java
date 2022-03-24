package com.kh.walkwork.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.walkwork.community.model.service.CommunityService;
import com.kh.walkwork.member.model.service.MemberService;
import com.kh.walkwork.member.model.vo.Cert;
import com.kh.walkwork.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; // 비밀번호 암호화

	@Autowired
	private MemberService memberService;

	@Autowired
	private CommunityService communityService;

	@Autowired
	private JavaMailSender sender; // 이메일전송

// 회원가입창으로 이동	
	@RequestMapping("enroll.me")
	public String selectNoticeList(HttpSession session) {
		session.removeAttribute("alertMsg");
		return "member/enrollForm";
	}

//	회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
//		System.out.println(m);
		System.out.println("넘어옴?");

		// 주소 합치기
		String str = m.getAddress();
		String[] strArr = str.split(",", 3);

		String address = strArr[0] + strArr[1] + strArr[2];
//		System.out.println(address);

		// 암호화 작업(암호문을 만들어내는 과정)
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
//		System.out.println("암호문 : " + encPwd);

//		System.out.println(encPwd);
		m.setMemberPwd(encPwd);

		int result = memberService.insertMember(m);

		if (result > 0) { // 성공=>메인페이지url 재요청

			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다");
			return "redirect:/";

		} else { // 실패=> 에러문구를 담아서 에러페이지로 포워딩
			model.addAttribute("alertMsg", "회원가입 실패");
			// /WEB-INF/views common/errorPage .jsp
			return "index";
		}

	}

//	 인증번호전송(메일 내용 수정 / return값 수정 필요)
	@ResponseBody
	@RequestMapping(value = "email.chk", produces = "application/json; charset=utf-8")
	public String emailInput(String email, HttpServletRequest request) throws MessagingException {
		String ip = request.getRemoteAddr();
		String secret = memberService.sendMail(ip);

		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setTo(email);
		helper.setSubject("인증하섿요");
		helper.setText("인증번호 : " + secret);

		sender.send(message);
//		System.out.println("인증번호전송성공");
		return secret;
	}

//	인증번호 일치여부 확인(return값 수정 필요)
	@ResponseBody
	@RequestMapping(value = "emailVali.chk", produces = "application/json; charset=utf-8")
	public int valiCheck(String emailVali, HttpServletRequest request) {
//		System.out.println("인증번호일치확인하러옴?");
//		
//		System.out.println(request.getRemoteAddr());
//		System.out.println(emailVali);

		int result = memberService
				.valiCheck(Cert.builder().ipInfo(request.getRemoteAddr()).veriCode(emailVali).build());
//		System.out.println(result);
		return result;
	}

//	이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "emailDupl.chk", produces = "application/json; charset=utf-8")
	public int emailDuplicationCheck(String emailDupl) {
//		System.out.println("이메일중복체크하러넘어옴?");
//		System.out.println(emailDupl);

		int result = memberService.emailDuplicationCheck(emailDupl);

		if (result > 0) {
			System.out.println("중복아이디있음 여기 왜 만들다 말았음??;;");
		} else {
			System.out.println("이메일중복체크실패or중복없음 왜 만들다 말았음?;;");
		}

		return result; // 수정하라고
	}

//	아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "idDupl.chk", produces = "application/json; charset=utf-8")
	public int idDuplicationCheck(String id) {
//		System.out.println("아이디중복체크하러넘어옴?");
//		System.out.println(id);

		int result = memberService.idDuplicationCheck(id);

		if (result > 0) {
			System.out.println("아이디중복체크성공 이거 왜 안함");
		} else {
			System.out.println("아이디중복체크실패or중복없음 이거 왜 안함");
		}

		return result; // 수정하라고
	}

//---------------------------로그인-----------------------------------

	


	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {

		Member loginUser = memberService.loginMember(m);

		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
																//입력받은			//암호화된
			//로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.addObject("alertMsg", "로그인성공");
			mv.setViewName("common/main");
			return mv;
		} else{
			
		//로그인 실패
			session.setAttribute("errorMsg", "아이디와 비밀번호를 확인하세요");

			mv.addObject("errorMsg", "로그인실패").setViewName("redirect:/");
			
			return mv;
		}
	}

//---------------------------------------------

	@ResponseBody
	@RequestMapping("searchId.me")
	public ModelAndView searchId(Member m, ModelAndView mv, HttpSession session) {

		Member b = memberService.searchId(m);

		String id = b.getMemberNo();
		session.setAttribute("alertMsg", m.getMemberName() + "님의 아이디는" + id + "입니다.");

		mv.addObject("id", "id").setViewName("redirect:/");
		return mv;
	}

	@ResponseBody
	@RequestMapping("searchPwd.me")
	public ModelAndView searchPwd(Member m, ModelAndView mv, HttpSession session) {

		System.out.println(m);

		Member b = memberService.searchId(m);

		String id = b.getMemberNo();
		session.setAttribute("alertMsg", m.getMemberName() + "님의 아이디는" + id + "입니다.");

		mv.addObject("id", "id").setViewName("redirect:/");
		return mv;
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}

//-----------윤희-----------------//

	// 회원정보

	@RequestMapping("information.me")
	public ModelAndView selectMemberInformation(Member m, HttpSession session, ModelAndView mv) {
		Member userInfo = (Member) session.getAttribute("loginUser");
		System.out.println(userInfo.getMemberNo());
		Member memberInfo = memberService.selectMemberInformation(userInfo);
		System.out.println(memberInfo.getMemberName());
		mv.addObject("memberInfo", memberInfo).setViewName("member/MemberInformation");
		return mv;
	}

	// 수정 정보
	@RequestMapping("informationMdf.me")
	public ModelAndView modifyMemberInformation(Member m, HttpSession session, ModelAndView mv) {

		Member memberInfo = memberService.selectMemberInformation(m);

		mv.addObject("memberInfo", memberInfo).setViewName("member/MemberInformationModify");
		return mv;
	}

	// 비밀번호 설정 페이지
	@RequestMapping("informationpwd.me")
	public String modifypwdPage(HttpSession session) {

		return "member/MemberInformationPwd";
	}

	// 비밀번호 수정 작업
	@RequestMapping("modifyPwd.me")
	public String modifyPwd(HttpSession session, Member m, ModelAndView mv) {
		String result = "";
		Member userInfo = (Member) session.getAttribute("loginUser");
		Member loginUser = memberService.loginMember(userInfo); // 흠

		String encodePassword = bcryptPasswordEncoder.encode(loginUser.getMemberPwd());

		if (loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), encodePassword)) {
			// modify
			Member nMember = new Member();
			nMember.setMemberNo(loginUser.getMemberNo());
			nMember.setMemberPwd(m.getTmpPwd());
			memberService.changePwd(nMember);

			result = "redirect:information.me";
			System.out.println("성공");
		} else {
			// 비밀번호 불일치
			result = "redirect:informationpwd.me";
			System.out.println("실패");
		}

		return result;
	}

	// 프로필 사진 업로드
	@ResponseBody
	@RequestMapping("addProfileImg.me")
	public String addProfileImg(HttpSession session,
			@RequestPart(value = "file1", required = false) MultipartFile file) {
		String result = "";
		String path = "C:\\walkworkFiles";

		String uploadpath = path;
		String originFileName = file.getOriginalFilename();
		String extName = originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
		// long size = file.getSize();
		String saveFileName = genSaveFileName(extName);
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdir();
		}
		File Nfile = new File(uploadpath, saveFileName);

		try {
			file.transferTo(Nfile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Member m = new Member();
		Member userInfo = (Member) session.getAttribute("loginUser");
		String memberNo = userInfo.getMemberNo();
		m.setMemberNo(memberNo);
		m.setFile(saveFileName);
		m.setFilePath(uploadpath);
		memberService.updateMemberFile(m);
		

		return result;
	}

	// 파일 이름 설정
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

}
