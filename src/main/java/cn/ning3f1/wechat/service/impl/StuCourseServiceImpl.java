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
		return stuCourseMapper.QuaryCredit(stuId);
	}

	@Override
	public int delstuScore(String stuId) {
		// TODO Auto-generated method stub
		return stuCourseMapper.deleteBystuId(stuId);
	}

	@Override
	public int addstuScore(String courseId, String stuId, String stuGrade) {
		// TODO Auto-generated method stub
		return stuCourseMapper.addstuScore(courseId,stuId,stuGrade);
	}

	/**
	 * 删除单条成绩记录
	 */
	@Override
	public int delScore(String courseId, String stuId) {
		// TODO Auto-generated method stub
		return stuCourseMapper.delScore(courseId,stuId);
	}

	@Override
	public int scoreupdate(String courseId, String stuId, String stuGrade) {
		// TODO Auto-generated method stub
		return stuCourseMapper.scoreupdate(courseId, stuId, stuGrade);
	}

	@Override
	public List<StuCourse> AllScore() {
		// TODO Auto-generated method stub
		return stuCourseMapper.AllScore();
	}

	@Override
	public List<StuCourse> courseScoreByName(String stuId, String courseName) {
		// TODO Auto-generated method stub
		return stuCourseMapper.courseScoreByName(stuId,courseName);
	}

	@Override
	public List<StuCourse> AllScoreByName(String courseName) {
		// TODO Auto-generated method stub
		return stuCourseMapper.AllScoreByName(courseName);
	}

}
