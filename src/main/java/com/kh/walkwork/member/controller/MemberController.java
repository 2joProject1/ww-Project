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

	@RequestMapping("login.back")
	public String loginBack(HttpSession session) {
		session.removeAttribute("alertMsg");
		return "common/login";
	}

// 회원가입창으로 이동	
	@RequestMapping("enroll.me")
	public String selectNoticeList(HttpSession session) {
		session.removeAttribute("alertMsg");
		return "member/enrollForm";
	}

//	회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session, HttpServletRequest request) {
		//주소 합치기
		String str = m.getAddress();
		String[] strArr = str.split(",", 3);

		String address = strArr[0] + strArr[1] + strArr[2];

		// 암호화 작업(암호문을 만들어내는 과정)
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());


		m.setMemberPwd(encPwd);

		int result = memberService.insertMember(m);

		if (result > 0) { // 성공=>메인페이지url 재요청

			request.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다");
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
		return secret;
	}

//	인증번호 일치여부 확인(return값 수정 필요)
	@ResponseBody
	@RequestMapping(value = "emailVali.chk", produces = "application/json; charset=utf-8")
	public int valiCheck(String emailVali, HttpServletRequest request) {

		int result = memberService
				.valiCheck(Cert.builder().ipInfo(request.getRemoteAddr()).veriCode(emailVali).build());
		return result;
	}

//	이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "emailDupl.chk", produces = "application/json; charset=utf-8")
	public int emailDuplicationCheck(String emailDupl) {

		int result = memberService.emailDuplicationCheck(emailDupl);

		return result;
	}

//아이디 중복체크	
	@ResponseBody
	@RequestMapping(value = "idDupl.chk", produces = "application/json; charset=utf-8")
	public int idDuplicationCheck(String id) {

		int result = memberService.idDuplicationCheck(id);

		return result;
	}

//---------------------------로그인-----------------------------------

	@RequestMapping("login.me")
	   public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, HttpServletRequest request) {
	      Member loginUser = memberService.loginMember(m);

	      //아이디 존재 + 비밀번호 일치
	      if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
	                                                //입력받은         //암호화된
	         //로그인 성공
	         session.setAttribute("loginUser", loginUser);
	         mv.addObject("alertMsg", "로그인성공");
//	         mv.setViewName("common/main");
	         mv.setViewName("redirect:main");
	         if(loginUser.getTmpPwd()!=null) {            
	            int pwdResult = memberService.deleteTmpPwd(loginUser);
	         }
	         //로그인 성공 시 실패 횟수 초기화
	         int result = memberService.loginFailReset(loginUser);
	         
	         
	         
	         return mv;
	      } 
	      // 아이디 존재 + 임시비밀번호 일치
	      else if(loginUser != null && m.getMemberPwd().equals(loginUser.getTmpPwd())) {
	         session.setAttribute("loginUser", loginUser);
	         mv.addObject("alertMsg", "로그인성공");
	         mv.setViewName("redirect:main");
	         
	         //로그인 성공 시 임시비밀번호 삭제(일회용, 더이상 사용할 수 없도록)
	         int pwdResult = memberService.deleteTmpPwd(loginUser);
	         //로그인 성공 시 실패 횟수 초기화
	         int failReset = memberService.loginFailReset(loginUser);
	         
	         return mv;
	         
	      }
	      // 존재하는 아이디 + 비밀번호 불일치 => 로그인실패횟수증가
	      else if(loginUser != null && !(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd()))){
	         
	         //로그인 실패 횟수 증가
	         int result = memberService.loginFail(loginUser);
	         //로그인 실패 횟수 조회
	         int loginFail = memberService.loginFailCount(loginUser);
	         //실패횟수 jsp로이동

	         
	         if(loginFail > 5) {
	            mv.addObject("loginFail", loginFail);
	            mv.setViewName("member/changePwd");
	            
	            session.setAttribute("countOverMsg", "로그인 실패 횟수가 5회를 초과하였습니다. 비밀번호 변경 페이지로 이동합니다.");
	            return mv;
	            
	         } 
	         
	         mv.addObject("loginFail", loginFail);
	         //jsp로이동
	         mv.setViewName("member/loginFail");
	         //알림메시지
	         request.setAttribute("errorMsg", "잘못된 비밀번호입니다.");
	         request.setAttribute("loginFailMsg", "로그인 실패 횟수"+loginFail+"회");
	         return mv;
	      } 
	      else{
	        // 존재하지 않는 아이디 
	         request.setAttribute("err", "존재하지않는 아이디입니다.");
	         mv.setViewName("member/loginFail");
	         
	         return mv;
	      }
	   }


//	---------------------------------------------
	// 아이디찾기
	@ResponseBody
	@RequestMapping("searchId.me")
	public ModelAndView searchId(Member m, ModelAndView mv, HttpSession session, HttpServletRequest request) {

		Member b = memberService.searchId(m);

		if (b != null) {

			String id = b.getMemberNo();
			session.setAttribute("alertMsg", m.getMemberName() + "님의 아이디는" + id + "입니다.");

			mv.addObject("id", "id").setViewName("redirect:/");
			return mv;
		} else {

			session.setAttribute("alertMsg", "존재하지 않는 회원입니다.");
			mv.addObject("id", "id").setViewName("redirect:/");
			return mv;
		}
	}

	// 비밀번호변경
	@ResponseBody
	@RequestMapping("changePwd.me")
	public ModelAndView changePwdLogin(Member m, ModelAndView mv, HttpSession session) {

		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());

		m.setMemberPwd(encPwd);

		int result = memberService.changePwdLogin(m);

		if (result > 0) {
			session.setAttribute("changeResult", "비밀번호 변경 성공. 로그인하세요");
			mv.setViewName("common/login");
		} else {
			session.setAttribute("changeResult", "비밀번호 변경 실패. 잘못된 정보입니다. 다시 입력하세요.");
			mv.setViewName("member/changePwd");
		}

		return mv;
	}

	// 로그아웃

	// 임시비밀번호 발급
	@RequestMapping("tmpPwd.me")
	public ModelAndView tmpPwd(Member m, ModelAndView mv, HttpServletRequest request) throws MessagingException {

		// 있는 회원인지 조회
		Member resultMember = memberService.searchMember(m);

		if (resultMember != null) {

			String email = m.getEmail();
			String secret = memberService.sendPwd(m);

			// 메일로 전송
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(email);
			helper.setSubject("walkWork 임시 비밀번호 발급");
			helper.setText("임시 비밀번호 : " + secret + "일회용 비밀번호입니다. 로그인 후 비밀번호를 변경하세요.");

			sender.send(message);
			request.setAttribute("tmpMsg", "메일로 임시비밀번호가 전송되었습니다.");
			mv.setViewName("common/login");

			return mv;
		} else {
			request.setAttribute("tmpMsg", "존재하지 않는 회원입니다. 다시 입력하세요.");
			mv.setViewName("common/login");

			return mv;
		}

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
		Member memberInfo = memberService.selectMemberInformation(userInfo);
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
		// 로그아웃 안하고 보여줌
		Member loginUser = memberService.loginMember(m); // 성공
		session.setAttribute("loginUser", loginUser);
		//

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
