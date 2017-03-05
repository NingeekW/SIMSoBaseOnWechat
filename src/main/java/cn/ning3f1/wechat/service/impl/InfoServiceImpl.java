package cn.ning3f1.wechat.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.wechat.dao.StuInfoMapper;
import cn.ning3f1.wechat.domain.StuInfo;
import cn.ning3f1.wechat.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService {
	@Resource
	private StuInfoMapper stuinfoMapper;
	
	@Override
	public int updateStuInfo(StuInfo stuInfo) {
		// 更新学生个人信息
		return stuinfoMapper.updateByPrimaryKeySelective(stuInfo);
	}

	@Override
	public int updateATInfo() {
		// TODO Auto-generated method stub
		return 0;
	}

}
