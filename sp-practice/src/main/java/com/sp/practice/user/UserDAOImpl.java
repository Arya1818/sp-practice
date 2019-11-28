package com.sp.practice.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionFactory ssf;

	@Override
	public List<Map<String, String>> selectUserList() {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.practice.dao.UserInfoMapper.selectUserInfoList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}

	@Override
	public UserVO selectUser(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectOne("com.sp.practice.dao.UserInfoMapper.selectUser", user);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}

	@Override
	public int insertUserInfo(UserVO user) {

		SqlSession ss = ssf.openSession();
		try {
			return ss.insert("com.sp.practice.dao.UserInfoMapper.insertUserInfo", user);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public int updateUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.update("com.sp.practice.dao.UserInfoMapper.updateUserInfo", user);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public int deleteUser(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			int cnt = ss.delete("com.sp.practice.dao.UserInfoMapper.deleteUserInfos", user);
			if (cnt != user.getUiNums().length) {
				ss.rollback();
				return 0;
			}
			ss.commit();
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
	}
}
