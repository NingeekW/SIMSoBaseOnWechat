package cn.ning3f1.wechat.domain;

public class WechatBindTeachAdminKey {
    private String taId;

    private String wechatUnionid;

    public String getTaId() {
        return taId;
    }

    public void setTaId(String taId) {
        this.taId = taId == null ? null : taId.trim();
    }

    public String getWechatUnionid() {
        return wechatUnionid;
    }

    public void setWechatUnionid(String wechatUnionid) {
        this.wechatUnionid = wechatUnionid == null ? null : wechatUnionid.trim();
    }
}