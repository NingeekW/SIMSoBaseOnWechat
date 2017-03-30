package cn.ning3f1.wechat.service;

import java.util.List;

import cn.ning3f1.wechat.domain.StuCourse;

public interface StuCourseService {
	public StuCourse courseScore(String stuId,String courseId);
	public List<StuCourse> courseAllScore(String stuId);
	public int delstuScore(String stuId);
	int addstuScore(String courseId,String stuId,String stuGrade);
	public int delScore(String courseId, String stuId);
	public int scoreupdate(String courseId, String stuId, String stuGrade);
	public List<StuCourse> AllScore();
	public List<StuCourse> courseScoreByName(String stuId, String courseName);
	public List<StuCourse> AllScoreByName(String courseName);
}
