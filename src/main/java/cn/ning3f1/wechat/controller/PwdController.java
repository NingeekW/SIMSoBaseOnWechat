package cn.ning3f1.wechat.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.AdminInfo;
import cn.ning3f1.wechat.domain.AdminLogin;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.domain.TeachAdminLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.service.InfoService;
import cn.ning3f1.wechat.service.LoginService;
import cn.ning3f1.wechat.service.PwdService;

//密码验证
@Controller
public class PwdController {
	
	@Resource
	private PwdService pwdService;
	@Resource
	private LoginService loginService;
	@Resource
	private InfoService infoService;
	
	@RequestMapping("changepwd.htm")
	public String changepwd(HttpSession session,ModelMap model){
		if(null != session.getAttribute("error")){
			model.put("error", session.getAttribute("error"));
			session.removeAttribute("error");
		}
		return Keys.PREFIX+"ChangePass.jsp";	
	}
	
	@RequestMapping("dochangepwd.htm")
	public String changepwd(HttpServletRequest request,ModelMap model){
		HttpSession session = request.getSession();
		
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		TAInfo taInfo = (TAInfo) session.getAttribute("TAInfo");
		AdminInfo adminInfo = (AdminInfo) session.getAttribute("AdminInfo");	
		String mpass = request.getParameter("mpass");
		String newpass = request.getParameter("newpass");
		String renewpass = request.getParameter("renewpass");
		if(mpass == null || newpass == null || renewpass == null){
			session.setAttribute("error", "必输项不能为空！！！");
			return "changepwd.htm";	
		}
		if(!renewpass.equals(newpass)){
			session.setAttribute("error", "输入两次密码不相同！！！");
			return "changepwd.htm";	
		}
		if(stuInfo != null){
			StuLogin user = null;
			user = pwdService.pwdCheck(stuInfo.getStuId(),request.getParameter("mpass"));
			if(user != null){
				if(request.getParameter("newpass").equals("null")){
					session.setAttribute("error", "密码不可用!!!");
					return "changepwd.htm";		
				}
				pwdService.stupwdChange(stuInfo.getStuId(),request.getParameter("newpass"));
				session.setAttribute("error", "密码修改成功!");
				return "changepwd.htm";		
			}
		}else if(taInfo != null){
			TeachAdminLogin user = null;
			user = loginService.TALogin(taInfo.getTaId(), request.getParameter("mpass"));
			if(user != null){
				if(request.getParameter("newpass").equals("null")){
					session.setAttribute("error", "密码不可用!!!");
					return "changepwd.htm";		
				}
				pwdService.tapwdChange(taInfo.getTaId(),request.getParameter("newpass"));
				session.setAttribute("error", "密码修改成功!");
				return "changepwd.htm";	
			}
		}else if(null != adminInfo){
			AdminLogin user = null;
			user = loginService.AdminLogin(adminInfo.getAdminId(), request.getParameter("mpass"));
			if(user != null){
				if(request.getParameter("newpass").equals("null")){
				//	model.put("error", "密码不可用");
					session.setAttribute("error", "密码不可用!!!");
					return "changepwd.htm";		
				}
				pwdService.adminpwdChange(adminInfo.getAdminId(),request.getParameter("newpass"));
				session.setAttribute("error", "密码修改成功!");
				return "changepwd.htm";		
			}
		}
		
		//System.out.println("密码错误");
		session.setAttribute("error", "原密码错误!!!");
		return "changepwd.htm";	
	}
	
	//跳转到修改密码页面
	@RequestMapping("findpass.htm")
	public String findpass(HttpSession session,ModelMap model){
		if(null != session.getAttribute("error")){
			model.put("error", session.getAttribute("error"));
			session.removeAttribute("error");
		}
		return Keys.PREFIX+"FindPasswd.jsp";	
	}
	
	//对用户信息进行校验是否为管理系统的用户
	@RequestMapping("dofindpass.htm")
	public String dofindpass(String username,String name,HttpSession session,ModelMap model){

		StuLogin STU = null;
		TeachAdminLogin TA = null;
		AdminLogin Admin = null;
		System.out.println("ningddd");
	
		STU = pwdService.stupwdfindCheck(username,name);
		if(STU != null){
			STU.setAllNull();
			StuInfo Stu = infoService.selectStuInfo(STU.getStuId());
			session.setAttribute("isLogin"+STU.getStuId(), "true"+STU.getStuId());
			session.setAttribute("stuInfo", Stu);
			return Keys.PREFIX+"FindChangePass.jsp";	
		}
		TA = pwdService.tapwdfindCheck(username,name);
		if(TA != null){
			TAInfo Ta = infoService.selectTAInfo(TA.getTaId());
			session.setAttribute("isLogin"+TA.getTaId(), "true"+TA.getTaId());
			session.setAttribute("TAInfo", Ta);
			return Keys.PREFIX+"FindChangePass.jsp";	
		}
		Admin = pwdService.apwdfindCheck(username, name);
		if(Admin != null){
			AdminInfo admin = infoService.selectAdminInfo(Admin.getAdminId());
			session.setAttribute("isLogin"+Admin.getAdminId(), "true"+Admin.getAdminId());
			session.setAttribute("AdminInfo", admin);
			return Keys.PREFIX+"FindChangePass.jsp";
		}
		//model.put("error", "该账号不存在！！！");
		session.setAttribute("error", "该账号不存在！！！");
		return "findpass.htm";	
	}
	
	//校验通过进行密码修改操作
	@RequestMapping("doFindchangepwd.htm")
	public String doFindchangepwd(HttpServletRequest request,ModelMap model){
		HttpSession session = request.getSession();
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		TAInfo taInfo = (TAInfo) session.getAttribute("TAInfo");	
		if(request.getParameter("newpass").equals("null")){
			model.put("error", "密码不可用");
			return Keys.PREFIX+"FindChangePass.jsp";	
		}
		if(null != stuInfo){
			pwdService.stupwdChange(stuInfo.getStuId(), request.getParameter("newpass"));
		}
		if(null != taInfo){
			pwdService.tapwdChange(taInfo.getTaId(), request.getParameter("newpass"));
		}

		session.setAttribute("info", "密码找回成功，欢迎使用！");
		return "index.htm";	
	}
	
}
