package cn.ning3f1.wechat.service;

import java.util.List;

import cn.ning3f1.wechat.domain.StuCourse;

public interface StuCourseService {
	public StuCourse courseScore(String stuId,String courseId);
	public List<StuCourse> courseAllScore(String stuId);
	public int delstuScore(String stuId);
}
