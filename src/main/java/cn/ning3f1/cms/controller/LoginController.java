package cn.ning3f1.cms.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lane.web.VerifyCodeServlet;

import cn.ning3f1.cms.domain.Userinfo;
import cn.ning3f1.cms.service.LoginService;
import cn.ning3f1.common.GetUserInfo;
import cn.ning3f1.common.Keys;

//登录
@Controller
public class LoginController {

	@Resource
	private LoginService loginService;
	
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
		//Userinfo user = loginService.userLogin(username, password);
		Userinfo user = new Userinfo();
		user.setUsername("fsdfd");
		user.setState("1");
		if(user != null){
			//账号密码验证通过且状态为启用则设置session
			if(!("1".equals(user.getState()))){
				model.put("error", "此用户不可用！");
				return "login.jsp";
			}
			//防止密码保存到session中
			user.setPassword("null");
			
			session.setAttribute("Userinfo", user);
			return "redirect:index.htm";
		}
		
		model.put("error", "用户名或密码错误！ ");
		return "login.jsp";
		
	}
	
	@RequestMapping("index.htm")
	public String index(ModelMap model,HttpSession session){
		//Userinfo user = (Userinfo)session.getAttribute("Userinfo");
		//System.out.println(user.getDepId());
		return Keys.PREFIX+"index.jsp";	
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
