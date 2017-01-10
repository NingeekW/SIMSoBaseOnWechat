package cn.ning3f1.cms.service;

import cn.ning3f1.cms.domain.Userinfo;

public interface LoginService {
	Userinfo userLogin(String username,String password);
}
