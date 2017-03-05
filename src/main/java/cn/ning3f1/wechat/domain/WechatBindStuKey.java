package cn.ning3f1.wechat.domain;

public class WechatBindStuKey {
    private String stuId;

    private String wechatUnionid;

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId == null ? null : stuId.trim();
    }

    public String getWechatUnionid() {
        return wechatUnionid;
    }

    public void setWechatUnionid(String wechatUnionid) {
        this.wechatUnionid = wechatUnionid == null ? null : wechatUnionid.trim();
    }
}