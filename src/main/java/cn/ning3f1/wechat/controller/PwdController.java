package cn.ning3f1.wechat.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.service.PwdService;

//密码验证
@Controller
public class PwdController {
	
	@Resource
	private PwdService pwdService;
	
	@RequestMapping("changepwd.htm")
	public String changepwd(){
		return Keys.PREFIX+"4/ChangePass.jsp";	
	}
	
	@RequestMapping("dochangepwd.htm")
	public String changepwd(HttpServletRequest request,ModelMap model){
		HttpSession session = request.getSession();
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		StuLogin user = null;
		user = pwdService.pwdCheck(stuInfo.getStuId(),request.getParameter("mpass"));
		if(user != null){
			if(request.getParameter("newpass").equals("null")){
				model.put("error", "密码不可用");
				return Keys.PREFIX+"4/ChangePass.jsp";	
			}
			pwdService.pwdChange(stuInfo.getStuId(),request.getParameter("newpass"));
			return Keys.PREFIX+"4/tips.jsp";	
		}
		//System.out.println("密码错误");
		model.put("error", "原密码错误!!!");
		return Keys.PREFIX+"4/ChangePass.jsp";	
	}
	
	//跳转到修改密码页面
	@RequestMapping("findpass.htm")
	public String findpass(){
		return Keys.PREFIX+"4/FindPasswd.jsp";	
	}
	
	//对用户信息进行校验是否为管理系统的用户
	@RequestMapping("dofindpass.htm")
	public String dofindpass(String username,String name,HttpSession session,ModelMap model){
		Userinfo user = null;
	
		user = pwdService.pwdfindCheck(username,name);
		
		if(user != null){
			user.setAllNull();
			session.setAttribute("Userinfo", user);
			return Keys.PREFIX+"4/FindChangePass.jsp";	
		}

		model.put("error", "该账号不存在！！！");
		return Keys.PREFIX+"4/FindPasswd.jsp";	
	}
	
	//校验通过进行密码修改操作
	@RequestMapping("doFindchangepwd.htm")
	public String doFindchangepwd(HttpServletRequest request,ModelMap model){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		if(request.getParameter("newpass").equals("null")){
			model.put("error", "密码不可用");
			return Keys.PREFIX+"4/FindChangePass.jsp";	
		}
		pwdService.pwdChange(user.getUsername(), request.getParameter("newpass"));
		model.put("error", "密码找回成功，请登录！");	
		return "login.htm";	
	}
	
}
