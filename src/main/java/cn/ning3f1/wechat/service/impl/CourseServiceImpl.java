package cn.ning3f1.wechat.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.CourseMapper;
import cn.ning3f1.wechat.dao.StuCourseMapper;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Resource
	private StuCourseMapper stucourseMmapper;
	
	@Resource
	private CourseMapper courseMapper;
	
	@Override
	public int addCourse(Course record) {
		// TODO Auto-generated method stub
		return courseMapper.insertSelective(record);
	}

	@Override
	public int updateCourse(Course record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCourse(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Course> selectallCourse(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
