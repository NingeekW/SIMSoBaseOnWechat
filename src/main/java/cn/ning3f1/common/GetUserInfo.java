package cn.ning3f1.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.ning3f1.cms.domain.Userinfo;

public final class GetUserInfo {
	private String username;

    private String password;

    private String name;

    private String phone;

    private String email;

    private Integer roleId;

    private String depId;

    private String state;
    
    //获得用户姓名
	public static final String getName(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		return user.getName();	
	}
	
	//得到用户部门id
	public static final String getDepId(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		return user.getDepId();	
	}
	
	//得到用户email
	public static final String getEmail(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		return user.getEmail();		
	}
	
	//得到用户手机�?
	public static final String getPhone(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		return user.getPhone();		
	}
	//得到用户�?
	public static final String getUsername(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		return user.getUsername();		
	}
	//得到用户角色id
	public static final Integer getRoleId(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("Userinfo");
		return user.getRoleId();		
	}
}
