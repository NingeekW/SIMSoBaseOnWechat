package cn.ning3f1.wechat.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.ning3f1.wechat.domain.Specialty;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.domain.TeachAdminLogin;
import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.domain.WechatBindTeachAdmin;
import cn.ning3f1.wechat.service.InfoService;
import cn.ning3f1.wechat.service.LoginService;


//用来拦截并验证是否已登录
public class SessionVer implements HandlerInterceptor{

	@Resource 
	private LoginService loginService;
	@Resource
	private InfoService infoService;
	
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)throws Exception {
		
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)throws Exception {
		
		
	}

	//Through to verify session  if is null To determine Whether User Logged
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession();
		if(null == session.getAttribute("SpecSession")){
			List<Specialty> spec = infoService.selectSpec();
			session.setAttribute("SpecSession", spec);
		}
		//登录退出跳过验证
		if("/login.htm".equals(request.getServletPath()) 
			||"/dologin.htm".equals(request.getServletPath()) 
			||"/findpass.htm".equals(request.getServletPath()) 
			||"/Wechat/security.htm".equals(request.getServletPath())
			||"/goindex.htm".equals(request.getServletPath())
			||"/gopersonCenter.htm".equals(request.getServletPath())
			||"/stubind.htm".equals(request.getServletPath())
			||"/tabind.htm".equals(request.getServletPath())
			||"/unbind.htm".equals(request.getServletPath())
			||"/dostubind.htm".equals(request.getServletPath())
			||"/dotabind.htm".equals(request.getServletPath())){
			return true;
		}

		
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		TAInfo taInfo = (TAInfo) session.getAttribute("TAInfo");	
		/**
		 * 当非教师角色登陆时，没有权限访问学生列表
		 */
		if("/stulist.htm".equals(request.getServletPath())
		 ||"/talist.htm".equals(request.getServletPath())
		 ||"/addta.htm".equals(request.getServletPath())
		 ||"/addstu.htm".equals(request.getServletPath())
		 ||"/studelete.htm".equals(request.getServletPath())
		 ||"/tadelete.htm".equals(request.getServletPath())
		 ||"/stuinfoadd.htm".equals(request.getServletPath())
		 ||"/tainfoadd.htm".equals(request.getServletPath())
		 ||"/courselist.htm".equals(request.getServletPath())
		 ||"/stuscorelist.htm".equals(request.getServletPath())
		 ||"/scoredelete.htm".equals(request.getServletPath())
		 ||"/toaddscore.htm".equals(request.getServletPath())
		 ||"/scoreadd.htm".equals(request.getServletPath())
		 ||"/scoreupdate.htm".equals(request.getServletPath())
		 ||"/goscoreupdate.htm".equals(request.getServletPath())){
			if(taInfo != null){
				return true;
			}else{
				response.sendRedirect("/StudentInfoMS/index.htm");
				return false;
			}
		}
		
		if("/stuinfo.htm".equals(request.getServletPath())){
			String str = request.getQueryString();
			int strlen = 0 ;
			if(str != null){
				strlen  = str.length();
			}
			//System.out.println("++++++++++"+str+"-----"+strlen+"****"+stuInfo.getStuId()+"///"+str.substring(3));
			if(taInfo != null){
				return true;
			}else if(null != stuInfo && null != str && strlen > 3 
					&& stuInfo.getStuId().equals(str.substring(3))){
				/**
				 * 学生只能访问自己的信息
				 */
				return true;
			}else{
				response.sendRedirect("/StudentInfoMS/index.htm");
				return false;
			}
		}
		/**
		 * 当session当存在stuInfo信息时，进行session的验证，验证通过则继续，否则返回错误
		 * 否则进行taLogin的判断是否为空，非空则进行session的验证，验证通过则继续，否则返回错误
		 * 否则返回错误
		 */
		if(stuInfo != null){
			String stustr = (String) session.getAttribute("isLogin"+stuInfo.getStuId());
			if(!("true"+stuInfo.getStuId()).equals(stustr)){
				response.sendRedirect("/StudentInfoMS/login.htm");
				return false;
			}
		}else if(taInfo != null){
			String str = (String) session.getAttribute("isLogin"+taInfo.getTaId());
			if(!("true"+taInfo.getTaId()).equals(str)){
				response.sendRedirect("/StudentInfoMS/login.htm");
				return false;
			}
		}else{
			//当验证微信用户已绑定学生信息管理系统时设置登录session直接进入
			WechatBindStu bindStu = loginService.isBindstu((String)session.getAttribute("openid")); 
			WechatBindTeachAdmin bindTA = loginService.isBindta((String)session.getAttribute("openid")); 
			if(bindStu != null){
				session.setAttribute("isLogin"+bindStu.getStuId(),"true"+bindStu.getStuId());
				StuInfo stuinfo = infoService.selectStuInfo(bindStu.getStuId());	
				session.setAttribute("stuInfo", stuinfo);
				return true;
			}else if (bindTA != null){
				session.setAttribute("isLogin"+bindTA.getTaId(),"true"+bindTA.getTaId());
				TAInfo tainfo = infoService.selectTAInfo(bindTA.getTaId());	
				session.setAttribute("TAInfo", tainfo);
				return true;
			}else{
				response.sendRedirect("/StudentInfoMS/login.htm");
				return false;
			}
		}
		
		
		return true;
	}
}

