package cn.ning3f1.wechat.domain;

public class EnterpressInfo {
    private Integer enId;

    private String enName;

    private String enLinkman;

    private String enTelephone;

    private String enAddress;

    public Integer getEnId() {
        return enId;
    }

    public void setEnId(Integer enId) {
        this.enId = enId;
    }

    public String getEnName() {
        return enName;
    }

    public void setEnName(String enName) {
        this.enName = enName == null ? null : enName.trim();
    }

    public String getEnLinkman() {
        return enLinkman;
    }

    public void setEnLinkman(String enLinkman) {
        this.enLinkman = enLinkman == null ? null : enLinkman.trim();
    }

    public String getEnTelephone() {
        return enTelephone;
    }

    public void setEnTelephone(String enTelephone) {
        this.enTelephone = enTelephone == null ? null : enTelephone.trim();
    }

    public String getEnAddress() {
        return enAddress;
    }

    public void setEnAddress(String enAddress) {
        this.enAddress = enAddress == null ? null : enAddress.trim();
    }
}