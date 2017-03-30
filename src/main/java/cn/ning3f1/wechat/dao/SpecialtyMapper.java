package cn.ning3f1.wechat.dao;

import java.util.List;

import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.Specialty;

public interface SpecialtyMapper {
    int deleteByPrimaryKey(String specId);

    int insert(Specialty record);

    int insertSelective(Specialty record);

    Specialty selectByPrimaryKey(String specId);

    int updateByPrimaryKeySelective(Specialty record);

    int updateByPrimaryKey(Specialty record);

	List<Specialty> selectSpec();

	List<Specialty> selectSpecByName(String specName);
}