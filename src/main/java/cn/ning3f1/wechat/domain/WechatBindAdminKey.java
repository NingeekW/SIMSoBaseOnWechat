package cn.ning3f1.wechat.domain;

public class WechatBindAdminKey {
    private String adminId;

    private String wechatUnionid;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getWechatUnionid() {
        return wechatUnionid;
    }

    public void setWechatUnionid(String wechatUnionid) {
        this.wechatUnionid = wechatUnionid == null ? null : wechatUnionid.trim();
    }
}