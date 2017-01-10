package cn.ning3f1.cms.dao;

import cn.ning3f1.cms.domain.Wechat_bind;
import cn.ning3f1.cms.domain.Wechat_bindKey;

public interface Wechat_bindMapper {
    int deleteByPrimaryKey(Wechat_bindKey key);

    int insert(Wechat_bind record);

    int insertSelective(Wechat_bind record);

    Wechat_bind selectByPrimaryKey(Wechat_bindKey key);

    int updateByPrimaryKeySelective(Wechat_bind record);

    int updateByPrimaryKey(Wechat_bind record);
}