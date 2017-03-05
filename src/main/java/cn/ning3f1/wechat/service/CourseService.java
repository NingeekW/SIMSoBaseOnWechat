package cn.ning3f1.wechat.service;

import java.util.List;
import java.util.Map;

import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.EnterpressInfo;

public interface CourseService {
	public int addCourse(Course record);
	public int updateCourse(Course record);
	public int deleteCourse(String id);
	public Course selectCourse(String courseName);
	public List<Course> selectallCourse();
	public List<Course> selectCourseByName(String courseName);
	public Course selectCourseBykey(String id);
}
