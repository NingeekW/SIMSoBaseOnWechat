package cn.ning3f1.cms.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.ning3f1.cms.domain.Userinfo;
import cn.ning3f1.cms.service.LoginService;


//用来拦截并验证是否已登录
public class SessionVer implements HandlerInterceptor{

	@Resource 
	private LoginService loginService;
	
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)throws Exception {
		
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)throws Exception {
		
		
	}

	//Through to verify session  if is null To determine Whether User Logged
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession();
		//登录退出跳过验证
		if("/login.htm".equals(request.getServletPath()) 
			||"/dologin.htm".equals(request.getServletPath()) 
			||"/findpass.htm".equals(request.getServletPath()) 
			||"/security.htm".equals(request.getServletPath())){
			//System.out.println("Login");
			return true;
		}
		System.out.println(request.getServletPath());
		
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		//System.out.println("session 验证 filter:"+user);
		if(user==null){		
			response.sendRedirect("/StudentInfoMS/login.htm");
			return false;
		}
		/*
		if((user.getRoleId(),request.getServletPath())){
			//如果该用户拥有请求该页面的权限则返回该页面

			return true;
		}else{
			//否则则返回没有权限界面，
			return false;
		}
		*/

		return true;
	}



}

