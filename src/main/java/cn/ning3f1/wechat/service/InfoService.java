package cn.ning3f1.wechat.service;

import java.util.List;

import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.TAInfo;

public interface InfoService {
	/**
	 * 学生信息管理方法
	 */
	public int addStuInfo(StuInfo stuInfo);
	public int deleteStuInfo(String stuId);
	public int updateStuInfo(StuInfo stuInfo);
	public StuInfo selectStuInfo(String stuId);
	public List<Course> StuInfoByname(String stuName);
	public List<StuInfo> queryStuInfo();
	/**
	 * 
	 * @param taInfo
	 *
	 * @author ning1
	 * @param 教师信息管理方法
	 */
	public int addTAInfo(TAInfo taInfo);
	public int updateTAInfo(TAInfo taInfo);
	public int deleteTAInfo(String taId);
	
	
}
