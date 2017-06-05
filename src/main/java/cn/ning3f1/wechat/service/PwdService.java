package cn.ning3f1.wechat.service;

import cn.ning3f1.wechat.domain.AdminLogin;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TeachAdminLogin;

public interface PwdService {
	public StuLogin pwdCheck(String stuId,String opassword);
	public StuLogin TApwdCheck(String taId,String opassword);
	public StuLogin stupwdfindCheck(String stuId,String password);
	public TeachAdminLogin tapwdfindCheck(String stuId,String password);
	public boolean stupwdChange(String stuId, String npassword);
	public boolean tapwdChange(String taId, String npassword);
	public AdminLogin apwdfindCheck(String username, String name);
	public void adminpwdChange(String adminId, String parameter);
}
