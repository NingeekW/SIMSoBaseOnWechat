package cn.ning3f1.wechat.domain;

public class StuCourse extends StuCourseKey {
    private Float stuGrade;
    private String courseName;
    private String credit; 
    private String allcredit;
    private String uncredit;
    
    public Float getStuGrade() {
        return stuGrade;
    }

    public void setStuGrade(Float stuGrade) {
        this.stuGrade = stuGrade;
    }

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getUncredit() {
		return uncredit;
	}

	public void setUncredit(String uncredit) {
		this.uncredit = uncredit;
	}

	public String getAllcredit() {
		return allcredit;
	}

	public void setAllcredit(String allcredit) {
		this.allcredit = allcredit;
	}
}