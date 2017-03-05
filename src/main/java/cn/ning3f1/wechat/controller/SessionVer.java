package cn.ning3f1.wechat.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.service.LoginService;


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
			||"/Wechat/security.htm".equals(request.getServletPath())
			||"/goindex.htm".equals(request.getServletPath())
			||"/gopersonCenter.htm".equals(request.getServletPath())
			||"/bind.htm".equals(request.getServletPath())
			||"/unbind.htm".equals(request.getServletPath())
			||"/dobind.htm".equals(request.getServletPath())){
			return true;
		}
		//当验证微信用户已绑定学生信息管理系统时设置登录session直接进入
		WechatBindStu bindStu = loginService.isBindstu((String)session.getAttribute("openid")); 
		if(bindStu != null){
			session.setAttribute("isLogin"+bindStu.getStuId(),"true"+bindStu.getStuId());
			StuInfo stuinfo = loginService.stuInfo(bindStu.getStuId());	
			session.setAttribute("stuInfo", stuinfo);
			//System.out.println("login");
			return true;
		}
		
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		if(stuInfo == null){
			response.sendRedirect("/StudentInfoMS/login.htm");
			return false;
		}
		
		String str = (String) session.getAttribute("isLogin"+stuInfo.getStuId());

		System.out.println("str"+str);
		if(!("true"+stuInfo.getStuId()).equals(str)){
			System.out.println("++++"+stuInfo.getStuId());

			response.sendRedirect("/StudentInfoMS/login.htm");
			return false;
		}

		return true;
	}
}

