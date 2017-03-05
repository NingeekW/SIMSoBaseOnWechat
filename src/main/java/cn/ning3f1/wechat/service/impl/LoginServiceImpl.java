package cn.ning3f1.wechat.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.StuInfoMapper;
import cn.ning3f1.wechat.dao.StuLoginMapper;
import cn.ning3f1.wechat.dao.UserinfoMapper;
import cn.ning3f1.wechat.dao.WechatBindStuMapper;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.domain.WechatBindStu;
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

	@Override
	public int unBindStu(String wechatUnionid) {
		// TODO Auto-generated method stub
		return wechatbindStuMapper.unbind(wechatUnionid);
	}
	

}
