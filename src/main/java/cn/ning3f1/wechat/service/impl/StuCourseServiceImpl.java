package cn.ning3f1.wechat.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.StuCourseMapper;
import cn.ning3f1.wechat.domain.StuCourse;
import cn.ning3f1.wechat.service.StuCourseService;

@Service
public class StuCourseServiceImpl implements StuCourseService{

	@Resource
	private StuCourseMapper stuCourseMapper;
	
	@Override
	public StuCourse courseScore(String stuId, String courseId) {
		// TODO Auto-generated method stub
		return stuCourseMapper.courseScore(stuId,courseId);
	}

	@Override
	public List<StuCourse> courseAllScore(String stuId) {
		// TODO Auto-generated method stub
		return stuCourseMapper.courseAllScore(stuId);
	}

	@Override
	public int delstuScore(String stuId) {
		// TODO Auto-generated method stub
		return stuCourseMapper.deleteBystuId(stuId);
	}

}
