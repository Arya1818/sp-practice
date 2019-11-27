package com.sp.practice.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	public List<Map<String,String>> getUserList();
	public List<UserVO> getUserVOList();
}
