package cn.ning3f1.cms.dao;

import cn.ning3f1.cms.domain.Stu_course;
import cn.ning3f1.cms.domain.Stu_courseKey;

public interface Stu_courseMapper {
    int deleteByPrimaryKey(Stu_courseKey key);

    int insert(Stu_course record);

    int insertSelective(Stu_course record);

    Stu_course selectByPrimaryKey(Stu_courseKey key);

    int updateByPrimaryKeySelective(Stu_course record);

    int updateByPrimaryKey(Stu_course record);
}