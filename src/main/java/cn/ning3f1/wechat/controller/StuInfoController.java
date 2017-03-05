package cn.ning3f1.wechat.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.service.CourseService;
import cn.ning3f1.wechat.service.InfoService;
import cn.ning3f1.wechat.service.LoginService;
import cn.ning3f1.wechat.service.StuCourseService;

/**
 * 
 * ClassName:StuInfoController.java
 * @Description:学生信息管理相关操作
 * @author Ning
 *
 * @time 2017年3月2日下午3:23:15
 *
 */
@Controller
public class StuInfoController {
	
	@Resource
	private InfoService infoService;
	@Resource
	private LoginService loginService;
	@Resource
	private StuCourseService stucourseService;
	

	/**
	 * 
	 * 查询所有的学生信息
	 * @return
	 */
	@RequestMapping("stulist.htm")
	public String courselist(ModelMap model){
		
		List<StuInfo> list=infoService.queryStuInfo();
		System.out.println("+++++++++++++++++++++");
		model.put("StuInfos", list);
		return Keys.PREFIX+"4/stulist.jsp";	
	}
	
	/**
	 * 根据姓名查询学生
	 * @param model
	 * @return
	 */
	@RequestMapping("StuByName.htm")
	public String CourseByName(HttpServletRequest request,ModelMap model){
		String stuName = "%"+request.getParameter("stuName")+"%";
		List<Course> stulist=infoService.StuInfoByname(stuName);
		model.put("StuInfos", stulist);
		//model.put("pages", page);
		return Keys.PREFIX+"4/stulist.jsp";	
	}
	/**
	 * 	//查看学生详细信息
	 */
	@RequestMapping("stuinfo.htm")
	public String courseinfo(String id,Map<String,Object> map){
		StuInfo stuInfo = infoService.selectStuInfo(id);
		map.put("StuInfo", stuInfo);
		return Keys.PREFIX+"4/stuinfo.jsp";	
	}
	
	/**
	 * 增加学生信息
	 * 请求到增加学生信息界面
	 */
	@RequestMapping("addstu.htm")
	public String addstu(){
		return Keys.PREFIX+"4/addstu.jsp";	
	}
	/**
	 * 添加学生信息到数据库
	 */
	@RequestMapping("stuinfoadd.htm")
	public String StuInfoAdd(StuInfo stu,ModelMap model){
		try {
			loginService.addStu(stu.getStuId(), stu.getStuName());
		} catch (Exception e) {
			// TODO: handle exception
			model.put("error","当前学生已存在");
			List<StuInfo> list=infoService.queryStuInfo();
			model.put("StuInfos", list);
			return Keys.PREFIX+"4/stulist.jsp";	
		}
		try {
			infoService.addStuInfo(stu);
		} catch (Exception e) {
			model.put("error","学生信息创建错误，请稍后重试...");
			List<StuInfo> list=infoService.queryStuInfo();
			model.put("StuInfos", list);
			loginService.delStu(stu.getStuId());
			return Keys.PREFIX+"4/stulist.jsp";	
		}
		
		return "stulist.htm";
	}	
	
	/**
	 * 从数据库中删除学生信息
	 */
	@RequestMapping("studelete.htm")
	 public String deleteStu(String id,ModelMap model){
		try {
			infoService.deleteStuInfo(id);
			stucourseService.delstuScore(id);
			loginService.unBindByStuid(id);
			loginService.delStu(id);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("当前学生不可删除");
			model.put("error","当前学生其他相关信息已存在，不可删除！");
			List<StuInfo> list=infoService.queryStuInfo();
			model.put("StuInfos", list);
			return Keys.PREFIX+"4/stulist.jsp";	
		}
		
		return "stulist.htm";
	}
	
	/**
	 * 
	 * 更新课程详细信息到数据库
	 * @return
	 */

	@RequestMapping("stuinfoupdata.htm")
	 public String updateCourse(StuInfo stuInfo,String passwd,HttpSession session){
		System.out.println("update");
		if(null != session.getAttribute("TAInfo") 
		 ||null != loginService.stuLogin(stuInfo.getStuId(),passwd)){
			infoService.updateStuInfo(stuInfo);
		}else{
			session.setAttribute("error", "pwd_error");
			return "personCenter.htm";
		}
		
		return "stulist.htm";
	}

}
