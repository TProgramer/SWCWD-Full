package com.ssafy.fit.model.service;

import java.util.List;

import com.ssafy.fit.model.dto.User;

public interface UserService {
	public List<User> getUserList();
	public int signup(User user);
	public User login(String id, String password);
}
