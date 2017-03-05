package cn.ning3f1.wechat.domain;

public class StuCourse extends StuCourseKey {
    private Float stuGrade;
    private String courseName;
    private String credit; 

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
}