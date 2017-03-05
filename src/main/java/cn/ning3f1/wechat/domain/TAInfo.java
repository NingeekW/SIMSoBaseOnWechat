package cn.ning3f1.wechat.domain;

public class TAInfo {
    private String taId;

    private String taName;

    private String taSex;

    private String taBirth;

    private String taNation;

    private Integer taClassId;

    private String taEntranceDate;

    private String taHome;

    private String taPolitic;

    private String idNumber;

    private String taSpecialty;

    public String getTaId() {
        return taId;
    }

    public void setTaId(String taId) {
        this.taId = taId == null ? null : taId.trim();
    }

    public String getTaName() {
        return taName;
    }

    public void setTaName(String taName) {
        this.taName = taName == null ? null : taName.trim();
    }

    public String getTaSex() {
        return taSex;
    }

    public void setTaSex(String taSex) {
        this.taSex = taSex == null ? null : taSex.trim();
    }

    public String getTaBirth() {
        return taBirth;
    }

    public void setTaBirth(String taBirth) {
        this.taBirth = taBirth;
    }

    public String getTaNation() {
        return taNation;
    }

    public void setTaNation(String taNation) {
        this.taNation = taNation == null ? null : taNation.trim();
    }

    public Integer getTaClassId() {
        return taClassId;
    }

    public void setTaClassId(Integer taClassId) {
        this.taClassId = taClassId;
    }

    public String getTaEntranceDate() {
        return taEntranceDate;
    }

    public void setTaEntranceDate(String taEntranceDate) {
        this.taEntranceDate = taEntranceDate;
    }

    public String getTaHome() {
        return taHome;
    }

    public void setTaHome(String taHome) {
        this.taHome = taHome == null ? null : taHome.trim();
    }

    public String getTaPolitic() {
        return taPolitic;
    }

    public void setTaPolitic(String taPolitic) {
        this.taPolitic = taPolitic == null ? null : taPolitic.trim();
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber == null ? null : idNumber.trim();
    }

    public String getTaSpecialty() {
        return taSpecialty;
    }

    public void setTaSpecialty(String taSpecialty) {
        this.taSpecialty = taSpecialty == null ? null : taSpecialty.trim();
    }
}