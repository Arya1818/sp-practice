package com.sp.practice.user;

import java.util.List;
import java.util.Map;

public interface UserDAO {
	public List<Map<String,String>> selectUserList();
	public List<UserVO> selectUserVOList();
}
