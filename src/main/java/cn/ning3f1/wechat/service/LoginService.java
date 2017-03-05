package cn.ning3f1.wechat.service;

import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.StuLogin;
import cn.ning3f1.wechat.domain.Userinfo;
import cn.ning3f1.wechat.domain.WechatBindStu;

public interface LoginService {
	Userinfo userLogin(String username,String password);
	StuLogin stuLogin(String stuId,String password);
	StuInfo  stuInfo(String stuId);
	WechatBindStu isBindstu(String wechatUnionid);
	int bindStu(String stuId,String stuName,String openid);
	int unBindStu(String wechatUnionid);
}
