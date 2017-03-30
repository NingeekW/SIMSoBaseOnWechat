package cn.ning3f1.wechat.dao;

import java.util.List;

import cn.ning3f1.wechat.domain.TAInfo;

public interface TAInfoMapper {
    int deleteByPrimaryKey(String taId);

    int insert(TAInfo record);

    int insertSelective(TAInfo record);

    TAInfo selectByPrimaryKey(String taId);

    int updateByPrimaryKeySelective(TAInfo record);

    int updateByPrimaryKey(TAInfo record);
    
    List<TAInfo> queryTAInfo();

	List<TAInfo> TAInfoByname(String taName);
}