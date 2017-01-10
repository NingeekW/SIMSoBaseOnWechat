package cn.ning3f1.cms.dao;

import cn.ning3f1.cms.domain.Stu_login;

public interface Stu_loginMapper {
    int deleteByPrimaryKey(Integer stuId);

    int insert(Stu_login record);

    int insertSelective(Stu_login record);

    Stu_login selectByPrimaryKey(Integer stuId);

    int updateByPrimaryKeySelective(Stu_login record);

    int updateByPrimaryKey(Stu_login record);
}