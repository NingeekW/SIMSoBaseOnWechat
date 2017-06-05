package cn.ning3f1.wechat.dao;

import cn.ning3f1.wechat.domain.StuLogin;

public interface StuLoginMapper {
    int deleteByPrimaryKey(String stuId);

    int insert(StuLogin record);

    int insertSelective(StuLogin record);

    StuLogin selectByPrimaryKey(String stuId);

    StuLogin stuLogin(String stuId,String password);
    
    int pwdChange(String stuId,String stuNPassword);
    
    int updateByPrimaryKeySelective(StuLogin record);

    int updateByPrimaryKey(StuLogin record);

	int insertStu(String stuId, String stuName);

	StuLogin pwdfindCheck(String username, String name);
}