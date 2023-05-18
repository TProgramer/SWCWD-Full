package com.ssafy.fit.model.dao;

import java.util.List;

import com.ssafy.fit.model.dto.User;

public interface UserDao {
	public List<User> selectAll();
	public int insertUser(User user);
	public User selectOne(String id);

}