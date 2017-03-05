package cn.ning3f1.wechat.domain;

public class WechatBindTeachAdmin extends WechatBindTeachAdminKey {
    private String taName;

    public String getTaName() {
        return taName;
    }

    public void setTaName(String taName) {
        this.taName = taName == null ? null : taName.trim();
    }
}