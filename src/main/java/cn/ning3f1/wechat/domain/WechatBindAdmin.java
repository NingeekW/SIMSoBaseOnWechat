package cn.ning3f1.wechat.domain;

public class WechatBindAdmin extends WechatBindAdminKey {
    private String adminName;

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }
}