package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.StuInfo;

public interface StuInfoMapper {
    int deleteByPrimaryKey(String stuId);

    int insert(StuInfo record);

    int insertSelective(StuInfo record);

    StuInfo selectByPrimaryKey(String stuId);

    int updateByPrimaryKeySelective(StuInfo record);

    int updateByPrimaryKey(StuInfo record);
}