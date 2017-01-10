package cn.ning3f1.cms.service;

import java.util.List;
import java.util.Map;

import cn.ning3f1.cms.domain.EnterpressInfo;


public interface EnterpressService {
	 public int addEnterpress(EnterpressInfo enterpress);
		public int updateEnterpress(EnterpressInfo enterpress);
		public int deleteEnterpress(int en_id);
		public EnterpressInfo selectEnterpress(int en_id);
		public List<EnterpressInfo> selectEnterpressByName(Map<String,Object>map);
		public List<EnterpressInfo> selectalltEnterpress(Map<String,Object>map);
		public List<EnterpressInfo> selectAll();
}
