package cn.ning3f1.cms.domain;

public class Wechat_bindKey {
    private Integer stuId;

    private String wechatUnionid;

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getWechatUnionid() {
        return wechatUnionid;
    }

    public void setWechatUnionid(String wechatUnionid) {
        this.wechatUnionid = wechatUnionid == null ? null : wechatUnionid.trim();
    }
}