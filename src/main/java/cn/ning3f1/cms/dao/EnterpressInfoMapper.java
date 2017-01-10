package cn.ning3f1.cms.dao;

import java.util.List;
import java.util.Map;

import cn.ning3f1.cms.domain.EnterpressInfo;

public interface EnterpressInfoMapper {
    int deleteByPrimaryKey(Integer enId);

    int insert(EnterpressInfo record);

    int insertSelective(EnterpressInfo record);

    EnterpressInfo selectByPrimaryKey(Integer enId);
    
    List<EnterpressInfo> selectByName_page(Map<String,Object> map);
  
    int updateByPrimaryKeySelective(EnterpressInfo record);

    int updateByPrimaryKey(EnterpressInfo record);
    
    List<EnterpressInfo> selectalltEnterpress_page(Map<String,Object> map);
    List<EnterpressInfo> selectAll();
	
}