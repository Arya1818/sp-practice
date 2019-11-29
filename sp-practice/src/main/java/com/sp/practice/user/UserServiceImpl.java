package com.sp.practice.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO udao;
	
	@Override
	public List<Map<String, String>> getUserList() {
		return udao.selectUserList();
	}

	@Override
	public UserVO getUser(UserVO user) {
		return udao.selectUser(user);
	}

	@Override
	public Map<String, String> insertUserInfo(UserVO user) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("cnt", udao.insertUserInfo(user) + "");
		return rMap;
	}

	@Override
	public Map<String, String> updateUserInfo(UserVO user) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("cnt", udao.updateUserInfo(user) + "");
		return rMap;
	}

	@Override
	public Map<String, String> deleteUserInfos(UserVO user) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("cnt", udao.deleteUserInfos(user) + "");
		return rMap;
	}

	@Override
	public UserVO doLogin(UserVO user) {
		return udao.selectUserInfo(user);
		
	}

}
