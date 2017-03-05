package cn.ning3f1.wechat.service;

import java.util.List;
import java.util.Map;

import cn.ning3f1.wechat.domain.Course;

public interface CourseService {
	public int addCourse(Course record);
	public int updateCourse(Course record);
	public int deleteCourse(String id);
	public List<Course> selectallCourse(Map<String,Object>map);
}
