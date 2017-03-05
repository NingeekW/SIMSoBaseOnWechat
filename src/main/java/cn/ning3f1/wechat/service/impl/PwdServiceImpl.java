package cn.ning3f1.wechat.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.StuInfoMapper;
import cn.ning3f1.wechat.dao.StuLoginMapper;
import cn.ning3f1.wechat.dao.UserinfoMapper;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.service.PwdService;

@Service
public class PwdServiceImpl implements PwdService {

	@Resource
	private UserinfoMapper userinofMapper;
	@Resource
	private StuLoginMapper stuloginMapper;
	
	public StuLogin pwdCheck(String username, String opassword) {
		//�?查原密码是否正确
		
		System.out.println("+++++++_________");
		return stuloginMapper.stuLogin(username,opassword);
	}
	
	public boolean pwdChange(String username, String npassword) {
		//�?查原密码是否正确
		stuloginMapper.pwdChange(username,npassword);
		return true;
	}

	@Override
	public Userinfo pwdfindCheck(String username, String name) {
		// TODO Auto-generated method stub
		return userinofMapper.pwdfindCheck(username, name);
	}

}
