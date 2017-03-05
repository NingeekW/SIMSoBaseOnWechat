package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.WechatBindTeachAdmin;
import cn.ning3f1.wechat.domain.WechatBindTeachAdminKey;

public interface WechatBindTeachAdminMapper {
    int deleteByPrimaryKey(WechatBindTeachAdminKey key);

    int insert(WechatBindTeachAdmin record);

    int insertSelective(WechatBindTeachAdmin record);

    WechatBindTeachAdmin selectByPrimaryKey(WechatBindTeachAdminKey key);

    int updateByPrimaryKeySelective(WechatBindTeachAdmin record);

    int updateByPrimaryKey(WechatBindTeachAdmin record);

	WechatBindTeachAdmin selectBind(String wechatUnionid);

	int bind(String taId,  String taName,String openid);

	int unbind(String wechatUnionid);

	int unbindByTAid(String tAId);
}