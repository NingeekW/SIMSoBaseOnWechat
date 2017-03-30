package cn.ning3f1.wechat.service;

import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.Userinfo;

public interface PwdService {
	public StuLogin pwdCheck(String stuId,String opassword);
	public StuLogin TApwdCheck(String taId,String opassword);
	public Userinfo pwdfindCheck(String stuId,String password);
	public boolean stupwdChange(String stuId, String npassword);
	public boolean tapwdChange(String taId, String npassword);
}
