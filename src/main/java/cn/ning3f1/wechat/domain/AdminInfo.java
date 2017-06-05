package cn.ning3f1.wechat.domain;

public class AdminInfo {
    private String adminId;

    private String adminName;

    private String adminSex;

    private String adminBirth;

    private String adminNation;

    private String adminEntranceDate;

    private String adminHome;

    private String adminPolitic;

    private String idNumber;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getAdminSex() {
        return adminSex;
    }

    public void setAdminSex(String adminSex) {
        this.adminSex = adminSex == null ? null : adminSex.trim();
    }

    public String getAdminBirth() {
        return adminBirth;
    }

    public void setAdminBirth(String adminBirth) {
        this.adminBirth = adminBirth;
    }

    public String getAdminNation() {
        return adminNation;
    }

    public void setAdminNation(String adminNation) {
        this.adminNation = adminNation == null ? null : adminNation.trim();
    }

    public String getAdminEntranceDate() {
        return adminEntranceDate;
    }

    public void setAdminEntranceDate(String adminEntranceDate) {
        this.adminEntranceDate = adminEntranceDate;
    }

    public String getAdminHome() {
        return adminHome;
    }

    public void setAdminHome(String adminHome) {
        this.adminHome = adminHome == null ? null : adminHome.trim();
    }

    public String getAdminPolitic() {
        return adminPolitic;
    }

    public void setAdminPolitic(String adminPolitic) {
        this.adminPolitic = adminPolitic == null ? null : adminPolitic.trim();
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber == null ? null : idNumber.trim();
    }
}