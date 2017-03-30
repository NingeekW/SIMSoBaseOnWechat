package cn.ning3f1.wechat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.EnterpressInfo;
import cn.ning3f1.wechat.service.EnterpressService;
@Controller

public class Enterpresstcontroller {
	@Resource
	private EnterpressService service;
	
	public Enterpresstcontroller(){
		
	}
	
	//请求到企业信息页面
	@RequestMapping("enlist.htm")
	public String enlist(Page page,ModelMap model){
		Map<String,Object> map=new HashMap<String,Object>();
		//page.setCount(5);
		//page.setShowTag(5);
		page.setPageNum(5);
		page.setPageSize(5);
		map.put("page", page);
		List<EnterpressInfo> list=service.selectalltEnterpress(map);
		
		model.put("enInfos", list);
		model.put("pages", page);
		return Keys.PREFIX+"enlist.jsp";	
	}
	
	
	//请求到增加企业信息界面
	@RequestMapping("addenifo.htm")
	public String addenifo(){
		return Keys.PREFIX+"adden.jsp";	
	}
	
	//请求到企业信息详情页面
	@RequestMapping("enpinfo.htm")
	public String enpinfo(String id,Map<String,Object> map){
		
		EnterpressInfo eninfo= service.selectEnterpress(Integer.parseInt(id));
		map.put("eninfo", eninfo);
		
		return Keys.PREFIX+"enp.jsp";	
	}
	
	//添加企业信息到数据库
	@RequestMapping("eninfoadd.htm")
	 public String addEnterpress(EnterpressInfo enterpress){
		service.addEnterpress(enterpress);
		return "enlist.htm";
	}
	
	//更新企业信息到数据库
	@RequestMapping("eninfoupdata.htm")
	 public String updateEnterpress(EnterpressInfo enterpress){
		System.out.println("update");
		service.updateEnterpress(enterpress);
		return "enlist.htm";
	}

	
	//从数据库删除企业信息
	@RequestMapping("eninfodelete.htm")
	 public String deleteEnterpress(String id){
		service.deleteEnterpress(Integer.parseInt(id));
		return "enlist.htm";
	}
	
	//通过企业名称进行模糊查询
	@RequestMapping("SelectByName.htm")
	 public String selectEnterpress(HttpServletRequest request,Page page,ModelMap model){
		Map<String,Object> map=new HashMap<String,Object>();
		String enName = "%"+request.getParameter("enName")+"%";
		page.setPageNum(5);
		//page.setShowTag(5);
		page.setPages(5);
		map.put("page", page);
		map.put("enName", enName);
		List<EnterpressInfo> list=service.selectEnterpressByName(map);
		model.put("enInfos", list);
		model.put("pages", page);
		return Keys.PREFIX+"enlist.jsp";	
	}

}
