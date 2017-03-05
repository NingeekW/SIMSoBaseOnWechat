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
import com.github.pagehelper.PageHelper;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.EnterpressInfo;
import cn.ning3f1.wechat.service.CourseService;
import cn.ning3f1.wechat.service.StuCourseService;

@Controller
public class CourseInfoController {

	@Resource
	private StuCourseService stucourse;
	
	@Resource
	private CourseService courseService;
	
	/**
	 * 课程管理相关操作
	 * @param model
	 * @return
	 */
	@RequestMapping("courselist.htm")
	public String courselist(ModelMap model){
		//查询所有的课程信息
		List<Course> list=courseService.selectallCourse();
		System.out.println("+++++++++++++++++++++");
		model.put("CourseInfos", list);
		//model.put("pages", page);
		return Keys.PREFIX+"4/courselist.jsp";	
	}
	/**
	 * 根据名称查询课程
	 * @param model
	 * @return
	 */
	@RequestMapping("CourseByName.htm")
	public String CourseByName(HttpServletRequest request,ModelMap model){
		String courseName = "%"+request.getParameter("courseName")+"%";
		List<Course> courselist=courseService.selectCourseByName(courseName);
		model.put("CourseInfos", courselist);
		//model.put("pages", page);
		return Keys.PREFIX+"4/courselist.jsp";	
	}
	
	//请求到增加课程信息界面
	@RequestMapping("addcourse.htm")
	public String addcourse(){
		return Keys.PREFIX+"4/addcourse.jsp";	
	}
	//添加课程信息到数据库
	@RequestMapping("courseinfoadd.htm")
	public String addEnterpress(Course course){
		courseService.addCourse(course);
		return "courselist.htm";
	}	
	
	//查看课程详细信息
	@RequestMapping("courseinfo.htm")
	public String courseinfo(String id,Map<String,Object> map){
		Course courseInfo= courseService.selectCourseBykey(id);
		map.put("courseInfo", courseInfo);
		return Keys.PREFIX+"4/courseinfo.jsp";	
	}
	
	//更新课程详细信息到数据库
	@RequestMapping("courseinfoupdata.htm")
	 public String updateCourse(Course course){
		System.out.println("update");
		courseService.updateCourse(course);
		return "courselist.htm";
	}
	//从数据库删除课程信息
	@RequestMapping("coursedelete.htm")
	 public String deleteEnterpress(String id,ModelMap model){
		try {
			courseService.deleteCourse(id);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("当前课程不可删除");
			model.put("error","当前课程已录入成绩，不可删除！");
			List<Course> list=courseService.selectallCourse();
			model.put("CourseInfos", list);
			return Keys.PREFIX+"4/courselist.jsp";	
		}
		
		return "courselist.htm";
	}
	
	@RequestMapping("score.htm")
	public String selectScore(String stuId,String course){
		
		return "scorelist.jsp";
	}
	
}
