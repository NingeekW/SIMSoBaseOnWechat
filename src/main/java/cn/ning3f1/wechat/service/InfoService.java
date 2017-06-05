package cn.ning3f1.wechat.service;

import java.util.List;

import cn.ning3f1.wechat.domain.AdminInfo;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.Specialty;
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
	public TAInfo selectTAInfo(String taId);
	public List<TAInfo> TAInfoByname(String taName);
	public List<TAInfo> queryTAInfo();
	public List<Specialty> selectSpec();
	
	
	
	/**
	 * 专业相关操作
	 */
	public List<Specialty> selectallSpec();
	public List<Specialty> selectSpecByName(String specName);
	public void addSpec(Specialty spec);
	public Specialty selectSpecByid(String id);
	public int updateSpec(Specialty spec);
	public int deleteSpec(String id);
	
	
	public AdminInfo selectAdminInfo(String adminId);
	public void updateAdminInfo(AdminInfo adminInfo);

	
	
}
