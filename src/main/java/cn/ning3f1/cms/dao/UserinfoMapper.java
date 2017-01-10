package cn.ning3f1.cms.dao;

import java.util.List;
import java.util.Map;

import cn.ning3f1.cms.domain.Userinfo;

public interface UserinfoMapper {
	
    boolean insert(Userinfo user);

    int insertSelective(Userinfo record);
    
    Userinfo loginCheck(String username,String password);
    Userinfo pwdCheck(String username,String password);
    Userinfo pwdfindCheck(String username,String name);
    Userinfo pwdChange(String username,String password);

	List<Userinfo> getAllInfo_page(Map<String,Object> map);

	boolean updateUserMsgByName(Userinfo user);

	Userinfo getInfoByName(String username);

	boolean deleteUser(String username);
}