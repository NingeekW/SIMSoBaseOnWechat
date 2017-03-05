package cn.ning3f1.wechat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.service.CourseService;
import cn.ning3f1.wechat.service.StuCourseService;

@Controller
public class InfoController {

	@Resource
	private StuCourseService stucourse;
	
	@Resource
	private CourseService courseService;
	
	@RequestMapping("courselist.htm")
	public String courselist(Page page,ModelMap model){
		//查询所有的课程信息
		Map<String,Object> map=new HashMap<String,Object>();
		//page.setCount(5);
		//page.setShowTag(5);
		page.setPageNum(5);
		page.setPageSize(5);
		map.put("page", page);
		List<Course> list=courseService.selectallCourse(map);
		
		model.put("enInfos", list);
		model.put("pages", page);
		return Keys.PREFIX+"4/courselist.jsp";	
	}
	
	//请求到增加课程信息界面
	@RequestMapping("addcourse.htm")
	public String addcourse(){
		return Keys.PREFIX+"4/addcourse.jsp";	
	}
	
	//从数据库删除课程信息
	@RequestMapping("coursedelete.htm")
	 public String deleteEnterpress(String id){
		courseService.deleteCourse(id);
		return "enlist.htm";
	}
	
	@RequestMapping("score.htm")
	public String selectScore(String stuId,String course){
		
		return "scorelist.jsp";
	}
	
}
