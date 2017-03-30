package cn.ning3f1.wechat.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ning3f1.common.Keys;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.Specialty;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.service.InfoService;
import cn.ning3f1.wechat.service.LoginService;
import cn.ning3f1.wechat.service.StuCourseService;

/**
 * 
 * ClassName:StuInfoController.java
 * @Description:学生、教师信息管理相关操作
 * @author Ning
 *
 * @time 2017年3月2日下午3:23:15
 *
 */
@Controller
public class InfoController {
	
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
	public String courselist(ModelMap model,HttpSession session){
		
		List<StuInfo> list=infoService.queryStuInfo();
		model.put("StuInfos", list);
		if(null != session.getAttribute("personCenter")){
			session.removeAttribute("personCenter");
		}
		
		return Keys.PREFIX+"stulist.jsp";	
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
		return Keys.PREFIX+"stulist.jsp";	
	}
	/**
	 * 	//查看学生详细信息
	 */
	@RequestMapping("stuinfo.htm")
	public String courseinfo(String id,Map<String,Object> map,HttpServletRequest request){
		String ua = request.getHeader("user-agent").toLowerCase();
		if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
			return Keys.mPREFIX+"stuinfo.jsp";		
		}

		StuInfo stuInfo = infoService.selectStuInfo(id);
		map.put("StuInfo", stuInfo);
		
		//得到session中的专业信息
		map.put("Specialtys", request.getSession().getAttribute("SpecSession"));
		
		return Keys.PREFIX+"stuinfo.jsp";	
	}
	
	/**
	 * 增加学生信息
	 * 请求到增加学生信息界面
	 */
	@RequestMapping("addstu.htm")
	public String addstu(HttpSession session,ModelMap map){
		//得到session中的专业信息
		map.put("Specialtys", session.getAttribute("SpecSession"));
		return Keys.PREFIX+"addstu.jsp";	
	}
	
	/**
	 * 增加教师信息
	 * 请求到增加教师信息界面
	 */
	@RequestMapping("addta.htm")
	public String addta(HttpSession session,ModelMap map){
		//得到session中的专业信息
		map.put("Specialtys", session.getAttribute("SpecSession"));
		return Keys.PREFIX+"addta.jsp";	
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
			return Keys.PREFIX+"stulist.jsp";	
		}
		try {
			infoService.addStuInfo(stu);
		} catch (Exception e) {
			model.put("error","学生信息创建错误，请稍后重试...");
			List<StuInfo> list=infoService.queryStuInfo();
			model.put("StuInfos", list);
			loginService.delStu(stu.getStuId());
			return Keys.PREFIX+"stulist.jsp";	
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
			return Keys.PREFIX+"stulist.jsp";	
		}
		
		return "stulist.htm";
	}


	/**
	 * 
	 * 查询所有的教师信息
	 * @return
	 */
	@RequestMapping("talist.htm")
	public String talist(ModelMap model,HttpSession session){
		
		List<TAInfo> list=infoService.queryTAInfo();
		
		model.put("TAInfos", list);
		model.put("Specialtys", session.getAttribute("SpecSession"));
		return Keys.PREFIX+"talist.jsp";	
	}
	
	/**
	 * 根据姓名查询学生
	 * @param model
	 * @return
	 */
	@RequestMapping("TAByName.htm")
	public String TAByName(HttpServletRequest request,ModelMap model){
		String taName = "%"+request.getParameter("taName")+"%";
		List<TAInfo> talist=infoService.TAInfoByname(taName);
		model.put("TAInfos", talist);
		model.put("Specialtys", request.getSession().getAttribute("SpecSession"));
		//model.put("pages", page);
		return Keys.PREFIX+"talist.jsp";	
	}
	/**
	 * 	//查看教师详细信息
	 */
	@RequestMapping("tainfo.htm")
	public String tainfo(String id,Map<String,Object> map,HttpServletRequest request){
		map.put("Specialtys", request.getSession().getAttribute("SpecSession"));
		TAInfo taInfo = infoService.selectTAInfo(id);
		map.put("taInfo", taInfo);
		//return Keys.mPREFIX+"stuinfo.jsp";	
		return Keys.PREFIX+"tainfo.jsp";	
	}
	

	/**
	 * 添加教师信息到数据库
	 */
	@RequestMapping("tainfoadd.htm")
	public String TAInfoAdd(TAInfo ta,ModelMap model,HttpSession session){
		TAInfo tainfosession = (TAInfo)session.getAttribute("TAInfo");
		if("0".equals(tainfosession.getAdmin())){
			try {
				loginService.addTA(ta.getTaId(), ta.getTaName());
			} catch (Exception e) {
				// TODO: handle exception
				model.put("error","当前教师已存在");
				List<TAInfo> list=infoService.queryTAInfo();
				model.put("TAInfos", list);
				return Keys.PREFIX+"talist.jsp";	
			}
			try {
				infoService.addTAInfo(ta);
			} catch (Exception e) {
				model.put("error","教师信息创建错误，请稍后重试...");
				List<TAInfo> list=infoService.queryTAInfo();
				model.put("TAInfos", list);
				loginService.delTA(ta.getTaId());
				return Keys.PREFIX+"talist.jsp";	
			}
		}else{
			model.put("error","无操作权限！！");
			List<TAInfo> list=infoService.queryTAInfo();
			model.put("TAInfos", list);
			return Keys.PREFIX+"talist.jsp";	
		}
		return "talist.htm";
	}	
	
	/**
	 * 从数据库中删除学生信息
	 */
	@RequestMapping("tadelete.htm")
	 public String deleteTA(String id,ModelMap model,HttpSession session){
		TAInfo tainfosession = (TAInfo)session.getAttribute("TAInfo");
		if("0".equals(tainfosession.getAdmin())){
			try {
				infoService.deleteTAInfo(id);
				loginService.unBindByTAid(id);
				loginService.delTA(id);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("当前教师不可删除");
				model.put("error","当前教师其他相关信息已存在，不可删除！");
				List<TAInfo> list=infoService.queryTAInfo();
				model.put("TAInfos", list);
				return Keys.PREFIX+"talist.jsp";	
			}
		}else{
			System.out.println("当前教师不可删除,无权限");
			model.put("error","无权限，不可删除！");
			List<TAInfo> list=infoService.queryTAInfo();
			model.put("TAInfos", list);
			return Keys.PREFIX+"talist.jsp";
		}
		return "talist.htm";
	}
	
	/**
	 * 
	 * 更新课程详细信息到数据库
	 * @return
	 * @throws IOException 
	 */

	@RequestMapping("infoupdata.htm")
	 public String updateCourse(StuInfo stuInfo,TAInfo taInfo,String passwd,
			 HttpServletResponse response,HttpServletRequest request,ModelMap model) throws IOException{
		HttpSession session = request.getSession();
		System.out.println("update");
		if(request.getHeader("Referer").indexOf("gopersonCenter.htm") > 0){
			/**
			 * 如果是个人中心的请求，需要密码验证 
			 */
			//System.out.println(passwd);
			//System.out.println(stuInfo.getStuId());
			//System.out.println(taInfo.getTaId());
			if(null != stuInfo && null != stuInfo.getStuId()
			&& null != loginService.stuLogin(stuInfo.getStuId(),passwd)){
				System.out.println("stuinfo update");
				infoService.updateStuInfo(stuInfo);
				session.setAttribute("stuInfo", infoService.selectStuInfo(stuInfo.getStuId()));
			}else if(null != taInfo && null != taInfo.getTaId()
				  && null != loginService.TALogin(taInfo.getTaId(), passwd)){
				System.out.println("tainfo update");
				infoService.updateTAInfo(taInfo);
				session.setAttribute("TAInfo", infoService.selectTAInfo(taInfo.getTaId()));
			
			}else{
				session.setAttribute("error", "pwd_error");
			}
			System.out.println("finally");
			response.sendRedirect("/StudentInfoMS/gopersonCenter.htm");
			return null;
		}else{
			TAInfo tainfosession = (TAInfo)session.getAttribute("TAInfo");
			/**
			 * 仅当为老师登陆时才可以进行其他人信息的修改
			 */
			System.out.println(tainfosession.getTaId());
			System.out.println(taInfo.getTaId()+"++++");
			System.out.println(stuInfo.getStuId()+"--");
			if(null != tainfosession ){
				System.out.println("update by ad start...");
				/**
				 * 判断是否为教师身份登录
				 */
				if(null != stuInfo && null != stuInfo.getStuId()){
					/**
					 * 更新学生信息
					 */
					System.out.println("stuInfo update by ad start");
					infoService.updateStuInfo(stuInfo);	
					System.out.println("stuInfo update by ad");
					session.setAttribute("stuInfo", infoService.selectStuInfo(stuInfo.getStuId()));
					return "stuinfo.htm?id="+stuInfo.getStuId();
				}
				if(null != taInfo && null != taInfo.getTaId()){
					/**
					 * 仅当教师具有管理员权限时才可修改其他教师的信息
					 */
					if( "0".equals(tainfosession.getAdmin())){
						System.out.println("taInfo update by ad 1start");
						infoService.updateTAInfo(taInfo);
						System.out.println("taInfo update by ad");
						session.setAttribute("TAInfo", infoService.selectTAInfo(taInfo.getTaId()));
						return "tainfo.htm?id="+taInfo.getTaId();
					}else{
						model.put("error","无权限进行操作！");
						model.put("Specialtys", request.getSession().getAttribute("SpecSession"));
						TAInfo Info = infoService.selectTAInfo(taInfo.getTaId());
						model.put("taInfo", Info);
						//return Keys.mPREFIX+"stuinfo.jsp";	
						return Keys.PREFIX+"tainfo.jsp";		
					}	
				}
			}
			
		}
		return "index.htm";
		
	}

}
