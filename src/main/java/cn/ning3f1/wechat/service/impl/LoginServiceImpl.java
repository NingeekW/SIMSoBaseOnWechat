package cn.ning3f1.wechat.service.impl;

import
 javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.AdminLoginMapper;
import cn.ning3f1.wechat.dao.StuInfoMapper;
import cn.ning3f1.wechat.dao.StuLoginMapper;
import cn.ning3f1.wechat.dao.TAInfoMapper;
import cn.ning3f1.wechat.dao.TeachAdminLoginMapper;
import cn.ning3f1.wechat.dao.UserinfoMapper;
import cn.ning3f1.wechat.dao.WechatBindAdminMapper;
import cn.ning3f1.wechat.dao.WechatBindStuMapper;
import cn.ning3f1.wechat.dao.WechatBindTeachAdminMapper;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.domain.AdminLogin;
import cn.ning3f1.wechat.domain.TeachAdminLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.domain.WechatBindAdmin;
import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.domain.WechatBindTeachAdmin;
import cn.ning3f1.wechat.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

	@Resource
	private  UserinfoMapper userinofMapper;
	@Resource
	private  StuLoginMapper stuloginMapper;
	@Resource 
	private WechatBindStuMapper wechatbindStuMapper;
	@Resource
	private StuInfoMapper stuinfoMapper;
	@Resource
	private WechatBindTeachAdminMapper wechatbindTAMapper;
	@Resource
	private TeachAdminLoginMapper TAloginMapper;
	@Resource
	private AdminLoginMapper AdminloginMapper;
	@Resource
	private TAInfoMapper tainfoMapper;
	@Resource
	private WechatBindAdminMapper wechatbindAdminMapper;

	public Userinfo userLogin(String username,String password){
		
		return userinofMapper.loginCheck(username, password);
		
	}

	@Override
	public StuLogin stuLogin(String stuId, String password) {
		// TODO Auto-generated method stub
		System.out.println("学生登录"+stuId);
		return stuloginMapper.stuLogin(stuId, password);
	}

	@Override
	public int bindStu(String stuId, String stuName, String openid) {
		// 微信账号与学号绑定
		return wechatbindStuMapper.bind(stuId, stuName, openid);
	}

	@Override
	public WechatBindStu isBindstu(String wechatUnionid) {
		// TODO Auto-generated method stub
		System.out.println(wechatUnionid);
		System.out.println("stuBind");
		return wechatbindStuMapper.selectBind(wechatUnionid);
	}

	@Override
	public StuInfo stuInfo(String stuId) {
		// 查找用户的个人信息
		return stuinfoMapper.selectByPrimaryKey(stuId);
	}

	/**
	 * 学生解绑
	 */
	@Override
	public int unBindStu(String wechatUnionid) {
		return wechatbindStuMapper.unbind(wechatUnionid);
	}

	/**
	 * 判断教师是否绑定
	 */
	@Override
	public WechatBindTeachAdmin isBindta(String wechatUnionid) {
		// TODO Auto-generated method stub
		return wechatbindTAMapper.selectBind(wechatUnionid);
	}

	/**
	 * 教师、管理员绑定
	 */
	@Override
	public int bindTA(String taId, String taName ,String openid) {
		// TODO Auto-generated method stub
		return wechatbindTAMapper.bind(taId, taName, openid);
	}

	/**
	 * 教师、管理员解绑
	 */
	@Override
	public int unBindTA(String wechatUnionid) {
		// TODO Auto-generated method stub
		return wechatbindTAMapper.unbind(wechatUnionid);
	}

	/**
	 * 教师、管理员登录、密码验证
	 */
	@Override
	public TeachAdminLogin TALogin(String taId, String password) {
		// TODO Auto-generated method stub
		return TAloginMapper.loginCheck(taId, password);
	}

	@Override
	public TAInfo taInfo(String taId) {
	
		// TODO Auto-generated method stub
		return tainfoMapper.selectByPrimaryKey(taId);
	}


	@Override
	public int addStu(String stuId, String stuName) {
		// TODO Auto-generated method stub
		return stuloginMapper.insertStu(stuId,stuName);
	}

	@Override
	public int addTA(String taId, String taName) {
		// TODO Auto-generated method stub
		return TAloginMapper.insertTA(taId,taName);
	}

	@Override
	public int delStu(String stuId) {
		// TODO Auto-generated method stub
		return stuloginMapper.deleteByPrimaryKey(stuId);
	}

	@Override
	public int delTA(String taId) {
		// TODO Auto-generated method stub
		return TAloginMapper.deleteByPrimaryKey(taId);
	}

	@Override
	public int unBindByStuid(String stuId) {
		// TODO Auto-generated method stub
		return wechatbindStuMapper.unbindByStuid(stuId);
	}

	@Override
	public int unBindByTAid(String TAId) {
		// TODO Auto-generated method stub
		return wechatbindTAMapper.unbindByTAid(TAId);
	}

	@Override
	public WechatBindAdmin isBindAdmin(String wechatUnionid) {
		// TODO Auto-generated method stub
		return wechatbindAdminMapper.selectBind(wechatUnionid);
	}

	@Override
	public void unBindAdmin(String openid) {
		// TODO Auto-generated method stub
		wechatbindAdminMapper.unbind(openid);
	}

	@Override
	public AdminLogin AdminLogin(String username, String password) {
		// TODO Auto-generated method stub
		return AdminloginMapper.loginCheck(username,password);
	}

	@Override
	public int BindAdmin(String adminId, String adminName, String openid) {
		// TODO Auto-generated method stub
		return wechatbindAdminMapper.bind(adminId, adminName, openid);
	}


}
