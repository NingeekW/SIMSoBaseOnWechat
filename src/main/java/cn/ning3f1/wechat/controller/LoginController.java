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
import cn.ning3f1.wechat.domain.AdminInfo;
import cn.ning3f1.wechat.domain.AdminLogin;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.domain.TeachAdminLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.domain.WechatBindAdmin;
import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.domain.WechatBindTeachAdmin;
import cn.ning3f1.wechat.service.InfoService;
import cn.ning3f1.wechat.service.LoginService;
import cn.ning3f1.wechat.service.StuCourseService;

//登录
@Controller
public class LoginController {

	@Resource
	private LoginService loginService;
	@Resource
	private InfoService infoService;

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
		System.out.println("登录操作");
		String sessionVercode = (String) session.getAttribute(VerifyCodeServlet.VERIFYCODE_KEY);
		if( sessionVercode !=null && !sessionVercode.equalsIgnoreCase(vercode)){
			model.put("info","验证码错误");
			
			return "login.jsp";
		}
		StuLogin        stuUser   = loginService.stuLogin(username, password);
		TeachAdminLogin taLogin   = loginService.TALogin(username, password);
		AdminLogin      AdminUser = loginService.AdminLogin(username, password);
		if(stuUser != null){
			StuInfo stuInfo = infoService.selectStuInfo(stuUser.getStuId());
			if(stuInfo == null){
				model.put("info","用户信息查询出错，请重试！");
				return "login.jsp";
			}
			//设置登录成功session标志
			session.setAttribute("isLogin"+stuUser.getStuId(), "true"+stuUser.getStuId());
			session.setAttribute("stuInfo", stuInfo);
			
			return "redirect:index.htm";
		}else if(taLogin != null){
			TAInfo taInfo = infoService.selectTAInfo(taLogin.getTaId());
			if(taInfo == null){
				model.put("info","用户信息查询出错，请重试！");
				return "login.jsp";
			}
			//设置登录成功session标志
			session.setAttribute("isLogin"+taLogin.getTaId(), "true"+taLogin.getTaId());
			session.setAttribute("TAInfo", taInfo);
			return "redirect:index.htm";
		}else if(AdminUser != null){
			AdminInfo adminInfo = infoService.selectAdminInfo(AdminUser.getAdminId());
			if(null == adminInfo){
				model.put("info","用户信息查询出错，请重试！");
				return "login.jsp";
			}
			session.setAttribute("isLogin"+AdminUser.getAdminId(), "true"+AdminUser.getAdminId());
			session.setAttribute("AdminInfo", adminInfo);
			return "redirect:index.htm";
		} 
		
		model.put("info", "用户名或密码错误！ ");
		return "login.jsp";
		
	}
	/**
	 * 学生绑定
	 */
	@RequestMapping("stubind.htm")
	public String stubind(String openid,HttpSession session,HttpServletRequest request,ModelMap model){//跳转到绑定页面
		System.out.println("bind"+openid);
		String ua = request.getHeader("user-agent").toLowerCase();
		if (!(ua.indexOf("micromessenger") > 0)) {// 是微信浏览器
			return "redirect:login.htm";		
		}
		session.setAttribute("openid", openid);
		WechatBindAdmin      admin  = loginService.isBindAdmin(openid);
		WechatBindStu        stu    = loginService.isBindstu(openid);
		WechatBindTeachAdmin ta     = loginService.isBindta(openid);
		StuInfo   stuInfo   = (StuInfo) session.getAttribute("stuInfo");
		TAInfo    taInfo    = (TAInfo) session.getAttribute("TAInfo");	
		AdminInfo adminInfo = (AdminInfo)session.getAttribute("AdminInfo");
		if(stuInfo != null || taInfo != null || adminInfo != null){
			return "redirect:index.htm";
		}
		if(stu != null){
			session.setAttribute("isLogin"+stu.getStuId(), "true"+stu.getStuId());
			StuInfo stuinfo = loginService.stuInfo(stu.getStuId());	
			session.setAttribute("stuInfo", stuinfo);
			return "redirect:index.htm";
		}else if(null != ta){
			session.setAttribute("TAInfo", infoService.selectTAInfo(ta.getTaId()));
			session.setAttribute("isLogin"+ta.getTaId(), "true"+ta.getTaId());
			session.setAttribute("info",  "您已绑定教师账号,不可进行重复绑定。 ");
			return "redirect:index.htm";
		}else if(null != admin){
			session.setAttribute("info",  "您已绑定管理员账号,不可进行重复绑定。 ");
			session.setAttribute("isLogin"+admin.getAdminId(), "true"+admin.getAdminId());
			session.setAttribute("AdminInfo", infoService.selectAdminInfo(admin.getAdminId()));
			return "redirect:index.htm";
		}
		if(null != session.getAttribute("VercodeInfo") ){
			if(session.getAttribute("VercodeInfo").equals("VercodeErr")){
				model.put("info","验证码错误");
			}else if(session.getAttribute("VercodeInfo").equals("passErr")){
				model.put("info","账号或密码错误！！");
			}
			
			session.removeAttribute("VercodeInfo");
		}
		
		return "stubind.jsp";
	}
	
	/**
	 * 
	 * @author ning1
	 * @ 教师/管理员绑定
	 */
	@RequestMapping("tabind.htm")
	public String tabind(String openid,HttpSession session,HttpServletRequest request,ModelMap model){//跳转到绑定页面
		System.out.println("bind"+openid);
		String ua = request.getHeader("user-agent").toLowerCase();
		if (!(ua.indexOf("micromessenger") > 0)) {// 是微信浏览器
			return "redirect:login.htm";		
		}
		session.setAttribute("openid", openid);
		WechatBindAdmin      admin  = loginService.isBindAdmin(openid);
		WechatBindStu        stu    = loginService.isBindstu(openid);
		WechatBindTeachAdmin ta     = loginService.isBindta(openid);
		StuInfo   stuInfo   = (StuInfo) session.getAttribute("stuInfo");
		TAInfo    taInfo    = (TAInfo) session.getAttribute("TAInfo");	
		AdminInfo adminInfo = (AdminInfo)session.getAttribute("AdminInfo");
		if(stuInfo != null || taInfo != null || adminInfo != null){
			return "redirect:index.htm";
		}
		if(ta != null){
			session.setAttribute("isLogin"+ta.getTaId(), "true"+ta.getTaId());
			TAInfo tainfo = infoService.selectTAInfo(ta.getTaId());	
			session.setAttribute("TAInfo", tainfo);
			return "redirect:index.htm";
		}else if(stu != null){
			session.setAttribute("info", "您已绑定学生账号,不可进行重复绑定。 ");
			session.setAttribute("stuInfo", infoService.selectStuInfo(stu.getStuId()));
			session.setAttribute("isLogin"+stu.getStuId(), "true"+stu.getStuId());
			return "redirect:index.htm";
		}else if(null != admin){
			session.setAttribute("info", "您已绑定管理员账号,不可进行重复绑定。 ");
			session.setAttribute("isLogin"+admin.getAdminId(), "true"+admin.getAdminId());
			session.setAttribute("AdminInfo", infoService.selectAdminInfo(admin.getAdminId()));
			return "redirect:index.htm";
		}
		if(null != session.getAttribute("VercodeInfo") ){
			if(session.getAttribute("VercodeInfo").equals("VercodeErr")){
				model.put("info","验证码错误");
			}else if(session.getAttribute("VercodeInfo").equals("passErr")){
				model.put("info","账号或密码错误！！");
			}
			
			session.removeAttribute("VercodeInfo");
		}
		return "tabind.jsp";
	}
	
	/**
	 * 管理员绑定
	 */
	
	@RequestMapping("adminbind.htm")
	public String adminbind(String openid,HttpSession session,HttpServletRequest request,ModelMap model){//跳转到绑定页面
		System.out.println("adminbind"+openid);
		String ua = request.getHeader("user-agent").toLowerCase();
		if (!(ua.indexOf("micromessenger") > 0)) {// 是微信浏览器
			return "redirect:login.htm";		
		}
		session.setAttribute("openid", openid);
		WechatBindAdmin      admin  = loginService.isBindAdmin(openid);
		WechatBindStu        stu    = loginService.isBindstu(openid);
		WechatBindTeachAdmin ta     = loginService.isBindta(openid);
		StuInfo   stuInfo   = (StuInfo) session.getAttribute("stuInfo");
		TAInfo    taInfo    = (TAInfo) session.getAttribute("TAInfo");	
		AdminInfo adminInfo = (AdminInfo)session.getAttribute("AdminInfo");
		if(stuInfo != null || taInfo != null || adminInfo != null){
			return "redirect:index.htm";
		}
		if(admin != null){
			session.setAttribute("isLogin"+admin.getAdminId(), "true"+admin.getAdminId());
			AdminInfo admininfo = infoService.selectAdminInfo(admin.getAdminId());	
			session.setAttribute("AdminInfo", admininfo);
			return "redirect:index.htm";
		}else if(ta != null){
			session.setAttribute("info",  "您已绑定教师账号,不可进行重复绑定。 ");
			session.setAttribute("TAInfo", infoService.selectTAInfo(ta.getTaId()));
			session.setAttribute("isLogin"+ta.getTaId(), "true"+ta.getTaId());
			return "redirect:index.htm";
		}else if(stu != null){
			session.setAttribute("info",  "您已绑定学生账号,不可进行重复绑定。 ");
			session.setAttribute("stuInfo", infoService.selectStuInfo(stu.getStuId()));
			session.setAttribute("isLogin"+stu.getStuId(), "true"+stu.getStuId());
			return "redirect:index.htm";
		}
		if(null != session.getAttribute("VercodeInfo") ){
			if(session.getAttribute("VercodeInfo").equals("VercodeErr")){
				model.put("info","验证码错误");
			}else if(session.getAttribute("VercodeInfo").equals("passErr")){
				model.put("info","账号或密码错误！！");
			}
			session.removeAttribute("VercodeInfo");
		}
		return "adminbind.jsp";
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
	public String dostubind(String username,String password,String vercode,HttpSession session,ModelMap model){
		System.out.println("学生绑定操作");
		String sessionVercode = (String) session.getAttribute(VerifyCodeServlet.VERIFYCODE_KEY);
		if( sessionVercode !=null && !sessionVercode.equalsIgnoreCase(vercode)){
			model.put("info","验证码错误");
			session.setAttribute("VercodeInfo", "VercodeErr");
			return "redirect:stubind.htm";
		}
		String openid = (String) session.getAttribute("openid");
		System.out.println(openid);
		StuLogin stuUser = loginService.stuLogin(username,password);
		WechatBindTeachAdmin isBindta = loginService.isBindta(openid);
		if(stuUser != null){
			//防止密码保存到session中
			if(null == isBindta){
				try {
					loginService.bindStu(stuUser.getStuId(), stuUser.getStuName(),openid);
				} catch (Exception e) {
					// TODO: handle exception
					model.put("info", "该账号已绑定其他微信用户 ");
					return "redirect:stubind.htm?openid="+openid;
				}
			}else{
				session.setAttribute("TAInfo", infoService.selectTAInfo(isBindta.getTaId()));
				session.setAttribute("isLogin"+isBindta.getTaId(), "true"+isBindta.getTaId());
				model.put("error", "您已绑定教师账号,不可进行重复绑定。 ");
				return Keys.PREFIX+"index.jsp";
			}
			
			stuUser.setStuPassword("null");
		//	session.setAttribute("StuLogin", stuUser);
			session.setAttribute("stuInfo", infoService.selectStuInfo(stuUser.getStuId()));
			session.setAttribute("isLogin"+stuUser.getStuId(), "true"+stuUser.getStuId());
			return "redirect:goindex.htm";
		}
		
		session.setAttribute("VercodeInfo","passErr");
		return "redirect:stubind.htm";
		
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
	public String dotabind(String username,String password,String vercode,HttpSession session,ModelMap model){
		System.out.println("学生绑定操作");
		String sessionVercode = (String) session.getAttribute(VerifyCodeServlet.VERIFYCODE_KEY);
		if( sessionVercode !=null && !sessionVercode.equalsIgnoreCase(vercode)){
			model.put("info","验证码错误");
			session.setAttribute("VercodeInfo", "VercodeErr");
			return "redirect:tabind.htm";
		}
		String openid = (String) session.getAttribute("openid");
		//System.out.println(openid);
		TeachAdminLogin taUser = loginService.TALogin(username,password);
		WechatBindStu isBindstu = loginService.isBindstu(openid);
		if(taUser != null){
			if(null == loginService.isBindstu(openid)){
				try {
					loginService.bindTA(taUser.getTaId(),taUser.getTaName(),openid);
				} catch (Exception e) {
					// TODO: handle exception
					model.put("info", "该账号已绑定其他微信用户 ");
					return "redirect:tabind.htm?openid="+openid;
				}
			}else{
				model.put("info", "您已绑定学生账号,不可进行重复绑定。 ");
				session.setAttribute("stuInfo", infoService.selectStuInfo(isBindstu.getStuId()));
				session.setAttribute("isLogin"+isBindstu.getStuId(), "true"+isBindstu.getStuId());
				return "login.jsp";
			}
			
			//防止密码保存到session中
			taUser.setTaPassword("null");
			//session.setAttribute("TeachAdminLogin", taUser);
			session.setAttribute("TAInfo", infoService.selectTAInfo(taUser.getTaId()));
			session.setAttribute("isLogin"+taUser.getTaId(), "true"+taUser.getTaId());
			return "redirect:goindex.htm";
		}
		
		session.setAttribute("VercodeInfo","passErr");
		return "redirect:tabind.htm";
		
	}
	/**
	 * 进行管理员绑定
	 * @param openid
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("doadminbind.htm")
	public String doadminbind(String username,String password,String vercode,HttpSession session,ModelMap model){
		System.out.println("管理员绑定操作");
		String sessionVercode = (String) session.getAttribute(VerifyCodeServlet.VERIFYCODE_KEY);
		if( sessionVercode !=null && !sessionVercode.equalsIgnoreCase(vercode)){
			model.put("info","验证码错误");
			session.setAttribute("VercodeInfo", "VercodeErr");
			return "redirect:tabind.htm";
		}
		String openid = (String) session.getAttribute("openid");
		//System.out.println(openid);
		AdminLogin adminUser = loginService.AdminLogin(username,password);
		WechatBindAdmin isBindadmin = loginService.isBindAdmin(openid);
		if(adminUser != null){
			if(null == isBindadmin){
				try {
					loginService.BindAdmin(adminUser.getAdminId(),adminUser.getAdminName(),openid);
				} catch (Exception e) {
					// TODO: handle exception
					model.put("info", "该账号已绑定其他微信用户 ");
					return "redirect:adminbind.htm?openid="+openid;
				}
			}else{
				model.put("info", "您已绑定管理员账号,不可进行重复绑定。 ");
				session.setAttribute("stuInfo", infoService.selectStuInfo(isBindadmin.getAdminId()));
				session.setAttribute("isLogin"+isBindadmin.getAdminId(), "true"+isBindadmin.getAdminId());
				return "login.jsp";
			}
			
			//防止密码保存到session中
			adminUser.setAdminPassword("null");
			//session.setAttribute("TeachAdminLogin", taUser);
			session.setAttribute("AdminInfo", infoService.selectAdminInfo(adminUser.getAdminId()));
			session.setAttribute("isLogin"+adminUser.getAdminId(), "true"+adminUser.getAdminId());
			return "redirect:goindex.htm";
		}
		
		session.setAttribute("VercodeInfo","passErr");
		return "redirect:adminbind.htm";
		
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
		}else if (loginService.isBindAdmin(openid) != null){
			loginService.unBindAdmin(openid);
			model.put("info", "管理员您好，您已解绑学生管理系统！");
			session.invalidate();
		}else {
			model.put("info", "您好，您还未绑定学生管理系统，期待你的使用!");	
		}
		return "login.jsp";
		
	}
	
	@RequestMapping("goindex.htm")
	public String goindex(){
//		String ua = request.getHeader("user-agent").toLowerCase();
//		if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
//		  	session.setAttribute("openid",openid);
//		  	return "index.htm?ua=micromessenger";	
//		}
		return "index.htm";	
	}
	
	@RequestMapping("index.htm")
	public String index(HttpSession session,ModelMap model){
		if(null != session.getAttribute("info")){
			model.put("error", session.getAttribute("info"));
			session.removeAttribute("info");
		}else{
			model.put("error", null);
		}
		return Keys.PREFIX+"index.jsp";	
	}
	@RequestMapping("gopersonCenter.htm")
	public String gopersonCenter(String openid,HttpSession session,ModelMap map){
		session.setAttribute("openid", openid);
		return "personCenter.htm";
	}

	/**
	 * 
	 * @param 
	 * @return
	 *
	 * 个人中心
	 */
	@RequestMapping("personCenter.htm")
	public String personCenter(HttpSession session,ModelMap map){
		/**
		 * 获取专业信息
		 */
		map.put("Specialtys", session.getAttribute("SpecSession"));
		if(session.getAttribute("error") != null  && 
		   session.getAttribute("error").equals("pwd_error")){
			map.put("error", "密码错误，修改失败！！！");
			session.removeAttribute("error");
			//System.out.println("+++err");
		}

		StuInfo stuInfo     = (StuInfo) session.getAttribute("stuInfo");
		TAInfo taInfo       = (TAInfo) session.getAttribute("TAInfo");
		AdminInfo adminInfo = (AdminInfo) session.getAttribute("AdminInfo");
		if(null != stuInfo){
			System.out.println(stuInfo.getStuPolitic());
				map.put("StuInfo", stuInfo);
				return Keys.PREFIX+"personCenter.jsp";
		}else if(null != taInfo){
				map.put("TAInfo", taInfo);
				System.out.println(taInfo.getTaPolitic());
				return Keys.PREFIX+"tpersonCenter.jsp";
		}else if(null != adminInfo){
			System.out.println("adminInfo");
				map.put("AdminInfo", adminInfo);
				System.out.println(adminInfo.getAdminPolitic());
				return Keys.PREFIX+"apersonCenter.jsp";
			
		}else{
			return "index.jsp";
		}

	}



	@RequestMapping("Welcome.htm")
	public String Welcome(){
		return Keys.PREFIX+"Welcome.html";	
	}
	
	@RequestMapping("Userinfo.htm")
	public String Userinfo(){
		return Keys.PREFIX+"Userinfo.jsp";	
	}
	

}
