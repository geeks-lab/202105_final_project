package com.kh.eyes.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.eyes.user.model.repository.UserRepository;
import com.kh.eyes.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	private final UserRepository userRepository;
	
	@Autowired
	private RestTemplate http;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public UserServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Override
	public User selectUserById(String userId) {
		return userRepository.selectUserById(userId);
	}

	@Override
	public int insertUser(User user) {
		user.setUserPwd(passwordEncoder.encode(user.getUserPwd()));
		return userRepository.insertUser(user);
	}

	@Override
	public User authenticateUser(User user) {

		User userInfo = userRepository.selectUserForAuth(user.getUserId());
		//System.out.println(userInfo);
		//System.out.println(user);
		if(userInfo == null || 
				!passwordEncoder.matches(user.getUserPwd(), userInfo.getUserPwd())) {
			System.out.println("????");
			return null;
		}
		return userInfo;
	}
	

}