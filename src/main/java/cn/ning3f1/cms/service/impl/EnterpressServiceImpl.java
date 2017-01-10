package cn.ning3f1.cms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ning3f1.cms.dao.EnterpressInfoMapper;
import cn.ning3f1.cms.domain.EnterpressInfo;
import cn.ning3f1.cms.service.EnterpressService;

@Service
public class EnterpressServiceImpl implements EnterpressService{
	@Resource
	private EnterpressInfoMapper enterpressInfoMapper;
	@Override
	 public int addEnterpress(EnterpressInfo enterpressInfo) {
		return enterpressInfoMapper.insert(enterpressInfo);
	}
	@Override
	public int updateEnterpress(EnterpressInfo enterpressInfo) {
		return enterpressInfoMapper.updateByPrimaryKeySelective(enterpressInfo);
	}
	@Override
	public int deleteEnterpress(int enId) {
		return enterpressInfoMapper.deleteByPrimaryKey(enId);
	}
	
	@Override
	public EnterpressInfo selectEnterpress(int enId) {
		return enterpressInfoMapper.selectByPrimaryKey(enId);
	}
	
	public List<EnterpressInfo> selectalltEnterpress(Map<String,Object>map) {
		
		return enterpressInfoMapper.selectalltEnterpress_page(map);
	}

	@Override
	public List<EnterpressInfo> selectEnterpressByName(Map<String,Object>map) {
		// TODO Auto-generated method stub
		return enterpressInfoMapper.selectByName_page(map);
	}
	@Override
	public List<EnterpressInfo> selectAll() {
		return enterpressInfoMapper.selectAll();
	}

}
