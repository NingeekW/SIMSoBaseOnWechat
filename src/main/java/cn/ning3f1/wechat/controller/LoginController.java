package cn.ning3f1.wechat.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lane.web.VerifyCodeServlet;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.domain.TeachAdminLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.domain.WechatBindTeachAdmin;
import cn.ning3f1.wechat.service.LoginService;
import cn.ning3f1.wechat.service.StuCourseService;

//登录
@Controller
public class LoginController {

	@Resource
	private LoginService loginService;


	public LoginController(LoginService loginService) {
		super();
		this.loginService = loginService;
	}

	public LoginController() {
		
	}

	@RequestMapping("login.htm")
	public String login(){
		return "login.jsp";	
	}
	
	@RequestMapping("dologin.htm")
	public String login(String username,String password,String vercode,HttpSession session,ModelMap model){
		System.out.println("demo");
		String sessionVercode = (String) session.getAttribute(VerifyCodeServlet.VERIFYCODE_KEY);
		if( sessionVercode !=null && !sessionVercode.equalsIgnoreCase(vercode)){
			model.put("error","验证码错误！");
			return "login.jsp";
		}
		//chekc username and password
		//Userinfo stuUser = loginService.userLogin(username, password);
		StuLogin stuUser = loginService.stuLogin(username, password);
		if(stuUser != null){
			StuInfo stuInfo = loginService.stuInfo(stuUser.getStuId());
			if(stuInfo == null){
				model.put("error","用户信息查询出错，请重试！");
				return "login.jsp";
			}
			//设置登录成功session标志
			session.setAttribute("isLogin"+stuUser.getStuId(), "true"+stuUser.getStuId());
			session.setAttribute("stuInfo", stuInfo);
			
			return "redirect:index.htm";
		}else{
			TeachAdminLogin taLogin = loginService.TALogin(username, password);
			if(taLogin != null){
				TAInfo taInfo = loginService.taInfo(taLogin.getTaId());
				if(taInfo == null){
					model.put("error","用户信息查询出错，请重试！");
					return "login.jsp";
				}
				//设置登录成功session标志
				session.setAttribute("isLogin"+taLogin.getTaId(), "true"+taLogin.getTaId());
				session.setAttribute("TAInfo", taInfo);
				System.out.println("000000000");
				return "redirect:index.htm";
			}
		} 
		
		model.put("info", "用户名或密码错误！ ");
		return "login.jsp";
		
	}
	/**
	 * 学生绑定
	 */
	@RequestMapping("stubind.htm")
	public String stubind(String openid,HttpSession session){//跳转到绑定页面
		System.out.println("bind"+openid);
		session.setAttribute("openid", openid);
		WechatBindStu stu = new WechatBindStu();
		stu = loginService.isBindstu(openid);
		if(stu != null){
			session.setAttribute("isLogin"+stu.getStuId(), "true"+stu.getStuId());
			StuInfo stuinfo = loginService.stuInfo(stu.getStuId());	
			session.setAttribute("StuInfo", stuinfo);
			return "index.htm";
		}
		
		return "stubind.jsp";
	}
	
	/**
	 * 
	 * @author ning1
	 * @ 教师/管理员绑定
	 */
	@RequestMapping("tabind.htm")
	public String tabind(String openid,HttpSession session){//跳转到绑定页面
		System.out.println("bind"+openid);
		session.setAttribute("openid", openid);
		WechatBindTeachAdmin ta = new WechatBindTeachAdmin();
		ta = loginService.isBindta(openid);
		if(ta != null){
			session.setAttribute("isLogin"+ta.getTaId(), "true"+ta.getTaId());
			TAInfo tainfo = loginService.taInfo(ta.getTaId());	
			session.setAttribute("TAInfo", tainfo);
			return "index.htm";
		}
		
		return "tabind.jsp";
	}
	/**
	 * 
	 * @param username
	 * @param password
	 * @param session
	 * @param model
	 * 进行学生绑定操作
	 */
	//进行绑定操作
	@RequestMapping("dostubind.htm")
	public String dostubind(String username,String password,HttpSession session,ModelMap model){

		String openid = (String) session.getAttribute("openid");
		System.out.println(openid);
		StuLogin stuUser = loginService.stuLogin(username,password);
		if(stuUser != null){
			//防止密码保存到session中

			try {
				loginService.bindStu(stuUser.getStuId(), stuUser.getStuName(),openid);
			} catch (Exception e) {
				// TODO: handle exception
				model.put("info", "该账号已绑定其他微信用户 ");
				return "login.jsp";
			}
			stuUser.setStuPassword("null");
			session.setAttribute("StuLogin", stuUser);
			session.setAttribute("isLogin"+stuUser.getStuId(), "true"+stuUser.getStuId());
			return "redirect:index.htm";
		}
		
		model.put("info", "用户名或密码错误！ ");
		return "login.jsp";
		
	}
	
	
	/**
	 * 
	 * @param username
	 * @param password
	 * @param session
	 * @param model
	 * 进行教师、管理员绑定操作
	 */
	@RequestMapping("dotabind.htm")
	public String dotabind(String username,String password,HttpSession session,ModelMap model){

		String openid = (String) session.getAttribute("openid");
		System.out.println(openid);
		TeachAdminLogin taUser = loginService.TALogin(username,password);
		if(taUser != null){

			try {
				loginService.bindTA(taUser.getTaId(),taUser.getTaName(),openid);
			} catch (Exception e) {
				// TODO: handle exception
				model.put("info", "该账号已绑定其他微信用户 ");
				return "login.jsp";
			}
			//防止密码保存到session中
			taUser.setTaPassword("null");
			session.setAttribute("TeachAdminLogin", taUser);
			session.setAttribute("isLogin"+taUser.getTaId(), "true"+taUser.getTaId());
			return "redirect:index.htm";
		}
		
		model.put("info", "用户名或密码错误！ ");
		return "login.jsp";
		
	}
	//取消绑定操作
	@RequestMapping("unbind.htm")
	public String unbind(String openid,ModelMap model,HttpSession session){
		session.setAttribute("openid", openid);
		if(loginService.isBindstu(openid) != null){
			loginService.unBindStu(openid);
			model.put("info", "同学你好，您已解绑学生管理系统！");
			session.invalidate();
		}else if (loginService.isBindta(openid) != null){
			loginService.unBindTA(openid);
			model.put("info", "老师您好，您已解绑学生管理系统！");
			session.invalidate();
		}else{
			model.put("info", "您好，您还未绑定学生管理系统，期待你的使用!");	
		}
		return "login.htm";
		
	}
	
	@RequestMapping("goindex.htm")
	public String goindex(String openid,HttpSession session,HttpServletRequest request){
		String ua = request.getHeader("user-agent").toLowerCase();
		if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
		  	session.setAttribute("openid",openid);
		  	return "index.htm?ua=micromessenger";	
		}
		return "index.htm";	
	}
	
	@RequestMapping("index.htm")
	public String index(String ua){
		if(ua != null && ua.equals("micromessenger")){
			return Keys.mPREFIX+"index.jsp";
		}
		return Keys.PREFIX+"index.jsp";	
	}
	
	@RequestMapping("gopersonCenter.htm")
	public String gopersonCenter(String openid,HttpSession session,HttpServletRequest request){
		String ua = request.getHeader("user-agent").toLowerCase();
		if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
		  	session.setAttribute("openid",openid);
		  	return "personCenter.htm?ua=micromessenger";	
		}
		return "personCenter.htm";	
	}
	
	/**
	 * 
	 * @param ua
	 * @return
	 * 根据不同浏览器标识进行不同的
	 *
	 * 个人中心
	 */
	@RequestMapping("personCenter.htm")
	public String personCenter(String ua,HttpSession session,ModelMap map){
		if(session.getAttribute("error") != null && 
		   session.getAttribute("error").equals("pwd_error")){
			map.put("error", "密码错误，修改失败！！！");
			session.removeAttribute("error");
		}
		if(ua != null && ua.equals("micromessenger")){
			return Keys.mPREFIX+"personCenter.jsp";
		}
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		map.put("StuInfo", stuInfo);
		return Keys.PREFIX+"4/personCenter.jsp";	
	}



	@RequestMapping("Welcome.htm")
	public String Welcome(){
		return Keys.PREFIX+"4/Welcome.html";	
	}
	
	@RequestMapping("Userinfo.htm")
	public String Userinfo(){
		return Keys.PREFIX+"4/Userinfo.jsp";	
	}
	

}
