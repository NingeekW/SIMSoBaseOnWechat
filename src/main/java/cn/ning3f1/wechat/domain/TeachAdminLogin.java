package cn.ning3f1.wechat.domain;

public class TeachAdminLogin {
    private String taId;

    private String taName;

    private String taPassword;

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

    public String getTaPassword() {
        return taPassword;
    }

    public void setTaPassword(String taPassword) {
        this.taPassword = taPassword == null ? null : taPassword.trim();
    }

	public void setAllNull() {
		// TODO Auto-generated method stub
		this.setTaPassword(null);
		this.setTaName(null);
	}
}