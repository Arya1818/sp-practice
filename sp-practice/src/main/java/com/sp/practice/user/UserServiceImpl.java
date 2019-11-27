package com.sp.practice.user;

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
	public List<UserVO> getUserVOList() {
		
		return udao.selectUserVOList();
	}

}
