package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.TAadmin;

public interface TAadminMapper {
    int insert(TAadmin record);

    int insertSelective(TAadmin record);
}