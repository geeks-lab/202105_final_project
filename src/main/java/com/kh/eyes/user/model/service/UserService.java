package com.kh.eyes.user.model.service;

import com.kh.eyes.user.model.vo.User;

public interface UserService {
	
	User selectMemberById(String userId);
	int insertMember(User member);
	User authenticateUser(User member);
}
