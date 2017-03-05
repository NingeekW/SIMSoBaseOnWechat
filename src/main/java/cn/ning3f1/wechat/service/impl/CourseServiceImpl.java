package cn.ning3f1.wechat.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.CourseMapper;
import cn.ning3f1.wechat.dao.StuCourseMapper;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.EnterpressInfo;
import cn.ning3f1.wechat.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Resource
	private StuCourseMapper stucourseMmapper;
	
	@Resource
	private CourseMapper courseMapper;
	
	/**
	 * 添加课程信息
	 */
	@Override
	public int addCourse(Course course) {
		// TODO Auto-generated method stub
		return courseMapper.insert(course);
	}

	/**
	 * 更新课程信息
	 */
	@Override
	public int updateCourse(Course course) {
		// TODO Auto-generated method stub
		return courseMapper.updateByPrimaryKey(course);
	}

	/**
	 * 删除课程信息
	 * 仅当当前删除课程没被使用
	 */
	@Override
	public int deleteCourse(String id) {
		// TODO Auto-generated method stub
		return courseMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 查看所有课程信息
	 */
	@Override
	public List<Course> selectallCourse() {
		// TODO Auto-generated method stub
		return courseMapper.courseAllInfo();
	}
	
	/**
	 * 通过名字准确获得课程信息
	 */
	@Override
	public Course selectCourse(String courseName) {
		// TODO Auto-generated method stub
		return courseMapper.selectCourse(courseName);
	}

	/**
	 * 通过名字模糊查询
	 * @param courseName
	 * @return
	 */
	@Override
	public List<Course> selectCourseByName(String courseName) {
		// TODO Auto-generated method stub
		return courseMapper.courseByName(courseName);
	}

	/**
	 * 通过课程号查询课程信息
	 */
	@Override
	public Course selectCourseBykey(String id) {
		// TODO Auto-generated method stub
		return courseMapper.selectByPrimaryKey(id);
	}

}
