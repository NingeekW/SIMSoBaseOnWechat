package cn.ning3f1.wechat.service;

import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.domain.TeachAdminLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.domain.WechatBindTeachAdmin;

public interface LoginService {
	public Userinfo userLogin(String username,String password);
	
	
	/** 
	 * 学生微信绑定相关
	 */
	
	public StuInfo  stuInfo(String stuId);
	public StuLogin stuLogin(String stuId,String password);
	public WechatBindStu isBindstu(String wechatUnionid);
	public int bindStu(String stuId,String stuName,String openid);
	public int unBindStu(String wechatUnionid);
	public int unBindByStuid(String stuId);
	/**
	 * 教师、管理员绑定相关
	 */
	public TAInfo  taInfo(String taId);
	public TeachAdminLogin TALogin(String taId,String password);
	public WechatBindTeachAdmin isBindta(String wechatUnionid);
	public int bindTA(String taId,String taName,String openid);
	public int unBindTA(String wechatUnionid);
	public int unBindByTAid(String TAId);
	
	/**
	 *增加用户登录信息相关操作
	 *
	 */
	public int addStu(String stuId,String stuName);
	public int addTA(String taId,String taName);
	public int delStu(String stuId);
	public int delTA(String taId);
}
