package cn.ning3f1.wechat.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.SpecialtyMapper;
import cn.ning3f1.wechat.dao.StuInfoMapper;
import cn.ning3f1.wechat.dao.TAInfoMapper;
import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.Specialty;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.domain.TAInfo;
import cn.ning3f1.wechat.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService {
	@Resource
	private StuInfoMapper stuinfoMapper;
	@Resource
	private TAInfoMapper tainfoMapper;
	@Resource
	private SpecialtyMapper SpecMapper;
	
	/**
	 * 更新学生个人信息
	 */
	@Override
	public int updateStuInfo(StuInfo stuInfo) {
		
		return stuinfoMapper.updateByPrimaryKeySelective(stuInfo);
	}

	/**
	 * 更新教师或管理员信息
	 */
	@Override
	public int updateTAInfo(TAInfo taInfo) {
		// TODO Auto-generated method stub
		return tainfoMapper.updateByPrimaryKey(taInfo);
	}

	/**
	 * 增加学生信息
	 */
	@Override
	public int addStuInfo(StuInfo stuInfo) {
		// TODO Auto-generated method stub
		return stuinfoMapper.insert(stuInfo);
	}

	/**
	 * 删除学生信息
	 */
	@Override
	public int deleteStuInfo(String stuId) {
		// TODO Auto-generated method stub
		return stuinfoMapper.deleteByPrimaryKey(stuId);
	}
	/**
	 * 删除教师或管理员
	 */
	@Override
	public int deleteTAInfo(String taId) {
		// TODO Auto-generated method stub
		return tainfoMapper.deleteByPrimaryKey(taId);
	}

	/**
	 * 增加教师或管理员
	 */
	@Override
	public int addTAInfo(TAInfo taInfo) {
		// TODO Auto-generated method stub
		return tainfoMapper.insert(taInfo);
	}

	@Override
	public List<StuInfo> queryStuInfo() {
		// TODO Auto-generated method stub
		return stuinfoMapper.selectAllStuInfo();
	}

	@Override
	public StuInfo selectStuInfo(String stuId) {
		// TODO Auto-generated method stub
		return stuinfoMapper.selectByPrimaryKey(stuId);
	}

	@Override
	public List<Course> StuInfoByname(String stuName) {
		// TODO Auto-generated method stub
		return stuinfoMapper.selectByStuName(stuName);
	}

	@Override
	public List<TAInfo> queryTAInfo() {
		// TODO Auto-generated method stub
		return tainfoMapper.queryTAInfo();
	}

	@Override
	public TAInfo selectTAInfo(String taId) {
		// TODO Auto-generated method stub
		return tainfoMapper.selectByPrimaryKey(taId);
	}

	@Override
	public List<Specialty> selectSpec() {
		// TODO Auto-generated method stub
		return SpecMapper.selectSpec();
	}

	@Override
	public List<Specialty> selectallSpec() {
		// TODO Auto-generated method stub
		return SpecMapper.selectSpec();
	}

	@Override
	public List<Specialty> selectSpecByName(String specName) {
		// TODO Auto-generated method stub
		return SpecMapper.selectSpecByName(specName);
	}

	@Override
	public void addSpec(Specialty spec) {
		// TODO Auto-generated method stub
		SpecMapper.insert(spec);
		return ;
	}

	@Override
	public Specialty selectSpecByid(String id) {
		// TODO Auto-generated method stub
		return SpecMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateSpec(Specialty spec) {
		// TODO Auto-generated method stub
		return SpecMapper.updateByPrimaryKey(spec);
	}

	@Override
	public int deleteSpec(String id) {
		// TODO Auto-generated method stub
		return SpecMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<TAInfo> TAInfoByname(String taName) {
		// TODO Auto-generated method stub
		return tainfoMapper.TAInfoByname(taName);
	}


	

}
