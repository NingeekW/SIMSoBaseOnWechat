package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.AdminInfo;

public interface AdminInfoMapper {
    int deleteByPrimaryKey(String adminId);

    int insert(AdminInfo record);

    int insertSelective(AdminInfo record);

    AdminInfo selectByPrimaryKey(String adminId);

    int updateByPrimaryKeySelective(AdminInfo record);

    int updateByPrimaryKey(AdminInfo record);
}