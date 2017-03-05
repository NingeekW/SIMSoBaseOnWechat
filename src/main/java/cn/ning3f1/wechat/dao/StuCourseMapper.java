package cn.ning3f1.wechat.dao;

import java.util.List;
import java.util.Map;

import cn.ning3f1.wechat.domain.StuCourse;
import cn.ning3f1.wechat.domain.StuCourseKey;
import cn.ning3f1.wechat.domain.Userinfo;

public interface StuCourseMapper {
    int deleteByPrimaryKey(StuCourseKey key);

    int insert(StuCourse record);

    int insertSelective(StuCourse record);

    StuCourse selectByPrimaryKey(StuCourseKey key);
    
    //得到学生的所有课程信息
    List<StuCourse> getAllInfo_page(Map<String,Object> map);
    
    int updateByPrimaryKeySelective(StuCourse record);

    int updateByPrimaryKey(StuCourse record);

	StuCourse courseScore(String stuId, String courseId);
	
	List<StuCourse> courseAllScore(String stuId);

	int deleteBystuId(String stuId);
	
}