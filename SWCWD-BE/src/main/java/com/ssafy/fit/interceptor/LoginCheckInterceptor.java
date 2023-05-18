
package com.ssafy.fit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.ssafy.fit.model.dto.User;

public class LoginCheckInterceptor implements HandlerInterceptor {
	//코드작성
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("잡혔음");
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath()+"/user/login");
			return false;
		}
		return true;
	}
}
