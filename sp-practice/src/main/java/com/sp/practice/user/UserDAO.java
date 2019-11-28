package com.sp.practice.user;

import java.util.List;
import java.util.Map;

public interface UserDAO {
	public List<Map<String,String>> selectUserList();
	public UserVO selectUser(UserVO user);
	public int insertUserInfo(UserVO user);
	public  int updateUserInfo(UserVO user);
	public int deleteUserInfos(UserVO user);
	
	
}
