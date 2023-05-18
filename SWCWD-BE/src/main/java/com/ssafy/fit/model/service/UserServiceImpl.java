package com.ssafy.fit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fit.model.dao.UserDao;
import com.ssafy.fit.model.dto.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<User> getUserList() {
		return userDao.selectAll();
	}

	@Override
	public int signup(User user) {
		int result = userDao.insertUser(user);
		return result;
	}

	@Override
	public User login(String id, String password) {
		User tmp = userDao.selectOne(id);
		if(tmp != null && tmp.getPassword().equals(password))
			return tmp;
		return null;
	}

}
