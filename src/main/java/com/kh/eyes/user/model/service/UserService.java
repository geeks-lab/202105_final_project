package com.kh.eyes.user.model.service;

import com.kh.eyes.user.model.vo.User;

public interface UserService {
	
	User selectUserById(String userId);
	int insertUser(User user);
	User authenticateUser(User user);
	
}