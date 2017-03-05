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
  //得到学生的所有课程信息
    List<Course> getAllInfo_page(Map<String,Object> map);
    
    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}