package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.AdminLogin;

public interface AdminLoginMapper {
    int deleteByPrimaryKey(String adminId);

    int insert(AdminLogin record);

    int insertSelective(AdminLogin record);

    AdminLogin selectByPrimaryKey(String adminId);

    int updateByPrimaryKeySelective(AdminLogin record);

    int updateByPrimaryKey(AdminLogin record);

	AdminLogin loginCheck(String adminId, String adminPassword);

	AdminLogin pwdfindCheck(String adminId, String name);

	void pwdChange(String adminId, String newpass);
}