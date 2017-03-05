package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.domain.WechatBindStuKey;

public interface WechatBindStuMapper {
    int deleteByPrimaryKey(WechatBindStuKey key);

    int insert(WechatBindStu record);
    
    int bind(String stuId, String stuName, String wechatUnionid);
    
    int unbind(String wechatUnionid);

    int insertSelective(WechatBindStu record);

    WechatBindStu selectByPrimaryKey(WechatBindStuKey key);
    
    WechatBindStu selectBind(String wechatUnionid);
    
    int updateByPrimaryKeySelective(WechatBindStu record);

    int updateByPrimaryKey(WechatBindStu record);

}