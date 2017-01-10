package cn.ning3f1.cms.dao;

import cn.ning3f1.cms.domain.Stu_info;

public interface Stu_infoMapper {
    int deleteByPrimaryKey(Integer stuId);

    int insert(Stu_info record);

    int insertSelective(Stu_info record);

    Stu_info selectByPrimaryKey(Integer stuId);

    int updateByPrimaryKeySelective(Stu_info record);

    int updateByPrimaryKey(Stu_info record);
}