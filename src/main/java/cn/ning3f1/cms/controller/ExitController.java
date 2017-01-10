package cn.ning3f1.cms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//退出控制
@Controller
public class ExitController {
	@RequestMapping("exit.htm")
	public String exit(HttpSession session){
		session.invalidate();
		return "redirect:login.htm";
	}

}
