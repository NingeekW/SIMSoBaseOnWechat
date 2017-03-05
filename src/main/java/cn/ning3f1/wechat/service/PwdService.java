package cn.ning3f1.wechat.service;

import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.Userinfo;

public interface PwdService {
	StuLogin pwdCheck(String stuId,String opassword);
	Userinfo pwdfindCheck(String stuId,String password);
	boolean pwdChange(String stuId, String npassword);
}
