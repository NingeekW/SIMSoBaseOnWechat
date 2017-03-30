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
import cn.ning3f1.wechat.domain.StuCourse;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.service.CourseService;
import cn.ning3f1.wechat.service.InfoService;
import cn.ning3f1.wechat.service.StuCourseService;

@Controller
public class CourseScoreController {

	@Resource
	private StuCourseService stucourseService;
	@Resource
	private InfoService infoService;
	@Resource
	private CourseService courseService;
	
	/**
	 * 课程管理相关操作
	 * @param model
	 * @return
	 */
	@RequestMapping("stuscorelist.htm")
	public String stusocrelist(ModelMap model){
		//查询所有的学生
		List<StuInfo> list=infoService.queryStuInfo();
		model.put("StuInfos", list);
		return Keys.PREFIX+"stusocrelist.jsp";	
	}
	
	@RequestMapping("couscorelist.htm")
	public String couscorelist(String id,ModelMap model,HttpSession session){
		//查询某位学生的所有成绩
		List<StuCourse> list=stucourseService.courseAllScore(id);
		model.put("StuCourses", list);
		model.put("id", id);
		return Keys.PREFIX+"couscorelist.jsp";
	}
	@RequestMapping("toaddscore.htm")
	public String toaddscore(String id,ModelMap model){
		//成绩录入
		List<Course> Courselist=courseService.selectallCourse();
		model.put("Courses", Courselist);
		model.put("id", id);
		return Keys.PREFIX+"addscore.jsp";	
	}
	@RequestMapping("scoreadd.htm")
	public String scoreadd(String stuId,String courseId, String stuGrade,ModelMap model){
		//成绩录入
		System.out.println("id"+courseId+"stuid"+stuId+"grade"+stuGrade);
		List<Course> Courselist=courseService.selectallCourse();
		model.put("Courses", Courselist);
		System.out.println(stuId);
		try {
			stucourseService.addstuScore(courseId, stuId, stuGrade);
		} catch (Exception e) {
			model.put("error", "成绩已存在！");
			System.out.println("成绩已存在！");
		}
		
		return "couscorelist.htm?id="+stuId;	
	}
	
	@RequestMapping("scoredelete.htm")
	public String scoredelete(String courseId, String stuId,ModelMap model,HttpServletRequest request){
		//成绩删除
		System.out.println("id"+courseId+"stuid"+stuId);
		try {
			stucourseService.delScore(courseId,stuId);
		} catch (Exception e) {
			// TODO: handle exception
			model.put("error", "成绩不存在！");
			System.out.println("成绩不存在！");
		}
		if(request.getHeader("Referer").indexOf("couscorelist.htm") > 0){
			return "couscorelist.htm?id="+stuId;
		}
		return "allscore.htm";	
	}
	
	@RequestMapping("goscoreupdate.htm")
	public String goscoreupdate(String courseId, String stuId,String courseName,ModelMap model){
		model.put("courseId",courseId);
		model.put("stuId",stuId);
		model.put("courseName",courseName);
		System.out.println(courseName);
		return Keys.PREFIX+"updatescore.jsp";	
	}
	
	@RequestMapping("scoreupdate.htm")
	public String scoreupdate(String courseId, String stuId,String stuGrade,ModelMap model){
		//成绩删除
		System.out.println("id"+courseId+"stuid"+stuId);
		try {
			stucourseService.scoreupdate(courseId, stuId, stuGrade);
		} catch (Exception e) {
			// TODO: handle exception
			model.put("error", "成绩修改失败，请重试");
			System.out.println("成绩修改失败！");
		}
		
		return "couscorelist.htm?id="+stuId;	
	}
	
	@RequestMapping("allscore.htm")
	public String allscore(HttpSession session,ModelMap model){
		//查询学生的所有成绩
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		TAInfo taInfo = (TAInfo) session.getAttribute("TAInfo");	
		if(null != stuInfo){
				List<StuCourse> list=stucourseService.courseAllScore(stuInfo.getStuId());
				model.put("StuCourses", list);
				//学生仅查询自己的成绩
				return Keys.PREFIX+"stuallscore.jsp";	
		}else if(null != taInfo){
			//教师用户查询所有的学生的信息
			List<StuCourse> list=stucourseService.AllScore();
			model.put("StuCourses", list);
		}
		
		return Keys.PREFIX+"allcouscorelist.jsp";			

	}
	@RequestMapping("StuScoreByName.htm")
	public String StuScoreByName(String CourseName,HttpSession session,ModelMap model){
		//查询学生的所有成绩
		StuInfo stuInfo = (StuInfo) session.getAttribute("stuInfo");
		TAInfo taInfo = (TAInfo) session.getAttribute("TAInfo");	
		if(null != stuInfo){
			System.out.println(CourseName);
				List<StuCourse> list=stucourseService.courseScoreByName(stuInfo.getStuId(),"%"+CourseName+"%");
				model.put("StuCourses", list);
				//学生仅查询自己的成绩
				return Keys.PREFIX+"stuallscore.jsp";
		}else if(null != taInfo){
			//教师用户查询所有的学生的信息
			List<StuCourse> list=stucourseService.AllScoreByName("%"+CourseName+"%");
			model.put("StuCourses", list);
		}
		
		return Keys.PREFIX+"allcouscorelist.jsp";			

	}
}
