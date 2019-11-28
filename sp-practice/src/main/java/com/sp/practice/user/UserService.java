package com.sp.practice.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	public List<Map<String,String>> getUserList();
	public UserVO getUser(UserVO user);
	public Map<String,String> insertUserInfo(UserVO user);
	public  Map<String,String> updateUserInfo(UserVO user);
}
