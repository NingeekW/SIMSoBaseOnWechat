package cn.ning3f1.cms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.cms.dao.UserinfoMapper;
import cn.ning3f1.cms.domain.Userinfo;
import cn.ning3f1.cms.service.PwdService;

@Service
public class PwdServiceImpl implements PwdService {

	@Resource
	private UserinfoMapper userinofMapper;
	
	public Userinfo pwdCheck(String username, String password) {
		//�?查原密码是否正确
		return userinofMapper.pwdCheck(username, password);
	}
	
	public boolean pwdChange(String username, String password) {
		//�?查原密码是否正确
		userinofMapper.pwdChange(username, password);
		return true;
	}

	@Override
	public Userinfo pwdfindCheck(String username, String name) {
		// TODO Auto-generated method stub
		return userinofMapper.pwdfindCheck(username, name);
	}

}
