package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.WechatBindAdmin;
import cn.ning3f1.wechat.domain.WechatBindAdminKey;

public interface WechatBindAdminMapper {
    int deleteByPrimaryKey(WechatBindAdminKey key);

    int insert(WechatBindAdmin record);

    int insertSelective(WechatBindAdmin record);

    WechatBindAdmin selectByPrimaryKey(WechatBindAdminKey key);

    int updateByPrimaryKeySelective(WechatBindAdmin record);

    int updateByPrimaryKey(WechatBindAdmin record);

	void unbind(String openid);

	WechatBindAdmin selectBind(String wechatUnionid);
	int bind(String adminId, String adminName, String wechatUnionid);
}