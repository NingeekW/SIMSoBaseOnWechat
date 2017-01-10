package cn.ning3f1.cms.service;

import cn.ning3f1.cms.domain.Userinfo;

public interface PwdService {
	Userinfo pwdCheck(String username,String name);
	Userinfo pwdfindCheck(String username,String password);
	boolean pwdChange(String username, String password);
}
