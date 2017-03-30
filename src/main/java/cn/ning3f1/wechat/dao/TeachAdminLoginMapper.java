package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.TeachAdminLogin;

public interface TeachAdminLoginMapper {
    int deleteByPrimaryKey(String taId);

    int insert(TeachAdminLogin record);

    int insertSelective(TeachAdminLogin record);

    TeachAdminLogin selectByPrimaryKey(String taId);

    int updateByPrimaryKeySelective(TeachAdminLogin record);

    int updateByPrimaryKey(TeachAdminLogin record);

	TeachAdminLogin loginCheck(String taId, String password);

	void pwdChange(String taid, String npassword);

	int insertTA(String taId, String taName);
}