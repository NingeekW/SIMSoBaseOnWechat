package cn.ning3f1.cms.domain;

public class Wechat_bind extends Wechat_bindKey {
    private String stuName;

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }
}