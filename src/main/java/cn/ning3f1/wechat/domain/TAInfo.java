package cn.ning3f1.wechat.domain;

public class TAInfo {
    private String taId;

    private String taName;

    private String taSex;

    private String taBirth;

    private String taNation;

    private String taClassId;

    private String taEntranceDate;

    private String taHome;

    private String taPolitic;

    private String idNumber;

    private String taSpecialty;
    
    private String taSpecialtyName;

    private String admin;
    
    private String adminName;

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

    public String getTaClassId() {
        return taClassId;
    }

    public void setTaClassId(String taClassId) {
        this.taClassId = taClassId == null ? null : taClassId.trim();
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
    
    public String getTaSpecialtyName() {
        return taSpecialtyName;
    }

    public void setTaSpecialtyName(String taSpecialtyName) {
        this.taSpecialtyName = taSpecialtyName == null ? null : taSpecialtyName.trim();
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin == null ? null : admin.trim();
    }

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
}