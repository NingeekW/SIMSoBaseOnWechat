package cn.ning3f1.wechat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.EnterpressInfo;
import cn.ning3f1.wechat.domain.Specialty;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.service.CourseService;
import cn.ning3f1.wechat.service.InfoService;
import cn.ning3f1.wechat.service.StuCourseService;

@Controller
public class SpecialtyController {

	@Resource
	private InfoService infoService;
	
	/**
	 * 专业管理相关操作
	 * @param model
	 * @return
	 */
	@RequestMapping("speclist.htm")
	public String speclist(ModelMap model,HttpServletRequest request){
		//查询所有的专业信息

		List<Specialty> list=infoService.selectallSpec();
		System.out.println("查询所有的专业信息");
		if(request.getHeader("Referer")!= null && request.getHeader("Referer").indexOf("addspec.htm") > 0){
			request.getSession().setAttribute("SpecSession", list);
		}
		
		model.put("Specialtys", list);
		//model.put("pages", page);
		return Keys.PREFIX+"speclist.jsp";	
	}
	/**
	 * 根据名称查询专业
	 * @param model
	 * @return
	 */
	@RequestMapping("specByName.htm")
	public String SpecByName(HttpServletRequest request,ModelMap model){
		String specName = "%"+request.getParameter("specName")+"%";
		List<Specialty> list=infoService.selectSpecByName(specName);
		model.put("Specialtys", list);
		//model.put("pages", page);
		return Keys.PREFIX+"speclist.jsp";	
	}
	
	//请求到增加课程信息界面
	@RequestMapping("addspec.htm")
	public String addcourse(){
		return Keys.PREFIX+"addspec.jsp";	
	}
	//添加专业信息到数据库
	@RequestMapping("specinfoadd.htm")
	public String addSpec(Specialty spec,ModelMap model){
		try {
			infoService.addSpec(spec);
		} catch (Exception e) {
			model.put("error","当前专业号已存在");
			List<Specialty> list=infoService.selectallSpec();
			model.put("Specialtys", list);
			return Keys.PREFIX+"speclist.jsp";	
		}
		
		return "speclist.htm";
	}	
	
	//查看专业详细信息
	@RequestMapping("specinfo.htm")
	public String specinfo(String id,Map<String,Object> map){
		Specialty  spec = infoService.selectSpecByid(id);
		map.put("Spec", spec);
		return Keys.PREFIX+"specinfo.jsp";	
	}
	
	//更新课程详细信息到数据库
	@RequestMapping("specupdata.htm")
	 public String specUpdata(Specialty  spec){
		System.out.println("update");
		infoService.updateSpec(spec);
		return "speclist.htm";
	}
	//从数据库删除课程信息
	@RequestMapping("specdelete.htm")
	 public String specDelete(String id,ModelMap model,HttpServletRequest request){
		TAInfo tainfosession = (TAInfo)request.getSession().getAttribute("TAInfo");
		if("0".equals(tainfosession.getAdmin())){
			//管理员可进行删除
			try {
				infoService.deleteSpec(id);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("当前专业不可删除");
				model.put("error","当前专业已使用，不可删除！");
				List<Specialty> list=infoService.selectallSpec();
				model.put("Specialtys", list);
				return Keys.PREFIX+"speclist.jsp";	
			}
		}else{
			model.put("error","无权限，不可删除！");
			List<Specialty> list=infoService.selectallSpec();
			model.put("Specialtys", list);
			return Keys.PREFIX+"speclist.jsp";
		}
		
		request.getSession().setAttribute("SpecSession", 
				infoService.selectallSpec());
		return "speclist.htm";
	}
	
	
}
