package cn.ning3f1.wechat.domain;

public class WechatBindStu extends WechatBindStuKey {
    private String stuName;

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }
}