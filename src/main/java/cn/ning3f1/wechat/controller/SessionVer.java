package cn.ning3f1.wechat.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.ning3f1.wechat.domain.AdminInfo;
import cn.ning3f1.wechat.domain.Specialty;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.domain.TeachAdminLogin;
import cn.ning3f1.wechat.domain.WechatBindAdmin;
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
			||"/adminbind.htm".equals(request.getServletPath())
			||"/unbind.htm".equals(request.getServletPath())
			||"/tostulist.htm".equals(request.getServletPath())
			||"/totalist.htm".equals(request.getServletPath())
			||"/tostuscorelist.htm".equals(request.getServletPath())
			||"/tocourselist.htm".equals(request.getServletPath())
			||"/tospeclist.htm".equals(request.getServletPath())
			||"/dostubind.htm".equals(request.getServletPath())
			||"/dotabind.htm".equals(request.getServletPath())
			||"/doadminbind.htm".equals(request.getServletPath())
			||"/dofindpass.htm".equals(request.getServletPath())){
			return true;
		}

		
		StuInfo   stuInfo   = (StuInfo) session.getAttribute("stuInfo");
		TAInfo    taInfo    = (TAInfo) session.getAttribute("TAInfo");	
		AdminInfo adminInfo = (AdminInfo)session.getAttribute("AdminInfo");
		
		/**
		 * 如果身份为管理员，所有页面均具有权限
		 */
		if(null != adminInfo){
			String str = (String) session.getAttribute("isLogin"+adminInfo.getAdminId());
			if(!("true"+adminInfo.getAdminId()).equals(str)){
				response.sendRedirect("/StudentInfoMS/login.htm");
				return false;
			}
			return true;
		}
		
		/**
		 * 当非教师角色登陆时，没有权限访问学生列表
		 */
		if(taInfo != null || stuInfo != null){
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
					 ||"/goscoreupdate.htm".equals(request.getServletPath())
					 ||"/speclist.htm".equals(request.getServletPath())){
						if(taInfo != null){
//							if(taInfo.getAdmin().equals("0")){
//								return true;
//							}else 
							if("/talist.htm".equals(request.getServletPath())
									||"/addta.htm".equals(request.getServletPath())
									||"/tadelete.htm".equals(request.getServletPath())
									||"/tainfoadd.htm".equals(request.getServletPath())
									||"/speclist.htm".equals(request.getServletPath())
								){
								response.sendRedirect("/StudentInfoMS/index.htm");
								return false;
							}
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
		}
		
		
		
		/**
		 * 当session当存在stuInfo信息时，进行session的验证，验证通过则继续，否则返回错误
		 * 否则进行taLogin的判断是否为空，非空则进行session的验证，验证通过则继续，否则返回错误
		 * 否则返回错误
		 */
		if(stuInfo != null){
			System.out.println("1111");
			String stustr = (String) session.getAttribute("isLogin"+stuInfo.getStuId());
			if(!("true"+stuInfo.getStuId()).equals(stustr)){
				response.sendRedirect("/StudentInfoMS/login.htm");
				return false;
			}
		}else if(taInfo != null){
			System.out.println("222");
			if(taInfo.getAdmin().equals("0")){
				session.setAttribute("ADMIN", "admin");
			}
			String str = (String) session.getAttribute("isLogin"+taInfo.getTaId());
			if(!("true"+taInfo.getTaId()).equals(str)){
				response.sendRedirect("/StudentInfoMS/login.htm");
				return false;
			}
		}else{
			System.out.println("333");
			//当验证微信用户已绑定学生信息管理系统时设置登录session直接进入
			WechatBindStu bindStu = loginService.isBindstu((String)session.getAttribute("openid")); 
			WechatBindTeachAdmin bindTA = loginService.isBindta((String)session.getAttribute("openid")); 
			WechatBindAdmin bindAdmin = loginService.isBindAdmin((String)session.getAttribute("openid"));
			
			if(bindStu != null){
				System.out.println("bindStu");
				session.setAttribute("isLogin"+bindStu.getStuId(),"true"+bindStu.getStuId());
				StuInfo stuinfo = infoService.selectStuInfo(bindStu.getStuId());	
				session.setAttribute("stuInfo", stuinfo);
				return true;
			}else if (bindTA != null){
				System.out.println("bindTA");
				session.setAttribute("isLogin"+bindTA.getTaId(),"true"+bindTA.getTaId());
				TAInfo tainfo = infoService.selectTAInfo(bindTA.getTaId());	
				session.setAttribute("TAInfo", tainfo);
				if(tainfo.getAdmin().equals("0")){
					session.setAttribute("ADMIN", "admin");
				}
				return true;
			}else if(null != bindAdmin){
				System.out.println("bindAdmin");
				session.setAttribute("isLogin"+bindAdmin.getAdminId(),"true"+bindAdmin.getAdminId());
				adminInfo = infoService.selectAdminInfo(bindAdmin.getAdminId());	
				session.setAttribute("AdminInfo", adminInfo);
				System.out.println(request.getServletPath());
				return true;
			}else{
				response.sendRedirect("/StudentInfoMS/login.htm");
				return false;
			}
		}
		
		
		return true;
	}
}

