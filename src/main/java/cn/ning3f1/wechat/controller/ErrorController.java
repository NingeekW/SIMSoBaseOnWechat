package cn.ning3f1.wechat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ning3f1.common.Keys;

@Controller
public class ErrorController {
	
	@RequestMapping("error.htm")
	public String enlist(){
		return Keys.PREFIX+"4/error.jsp";	
	}
}
