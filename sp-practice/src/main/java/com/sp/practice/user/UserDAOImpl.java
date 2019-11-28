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
			int cnt = ss.insert("com.sp.practice.dao.UserInfoMapper.insertUserInfo", user);
			ss.commit();
			return cnt;
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
			int cnt = ss.update("com.sp.practice.dao.UserInfoMapper.updateUserInfo", user);
			System.out.println("cnt : " + cnt);
			ss.commit();
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public int deleteUserInfos(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			int cnt = ss.delete("com.sp.practice.dao.UserInfoMapper.deleteUserInfos", user);
			System.out.println("cnt : " + cnt);
			ss.commit();
			if (cnt != user.getUiNums().length) {
				ss.rollback();
				return 0;
			}
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return 0;
	}
}
