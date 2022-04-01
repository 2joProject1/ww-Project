package com.kh.walkwork.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter{


	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {

		HttpSession session = request.getSession();
		//현재 요청을 보낸 사람이 로그인 되어 있을 경우 => Controller 실행
		if(session.getAttribute("loginUser") != null) {
			return true;
		} else {// 로그인이 되어잇지 않을 경우 => Controller 실행 X
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath()); 
			return false;
		}
	}
}
