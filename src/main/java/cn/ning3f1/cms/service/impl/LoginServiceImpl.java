package cn.ning3f1.cms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.cms.dao.UserinfoMapper;
import cn.ning3f1.cms.domain.Userinfo;
import cn.ning3f1.cms.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

	@Resource
	private  UserinfoMapper userinofMapper;

	public Userinfo userLogin(String username,String password){
		
		return userinofMapper.loginCheck(username, password);
		
	}
	

}
