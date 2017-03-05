package cn.ning3f1.wechat.dao;

import java.util.List;
import java.util.Map;

import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.StuCourse;

public interface CourseMapper {
    int deleteByPrimaryKey(String courseId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(String courseId);
    
    Course selectCourse(String courseName);
    
  //得到学生的所有课程信息
    List<Course> courseAllInfo();
    //通过名字模糊查询
    List<Course> courseByName(String courseName);
    
    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}