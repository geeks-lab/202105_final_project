package com.kh.eyes.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.eyes.user.model.repository.UserRepository;
import com.kh.eyes.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	private final UserRepository memberRepository;
	
	@Autowired
	private RestTemplate http;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public UserServiceImpl(UserRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	@Override
	public User selectMemberById(String userId) {
		return memberRepository.selectMemberById(userId);
	}
	

	@Override
	public int insertMember(User member) {
		
		member.setPw(passwordEncoder.encode(member.getUserPwd()));
		return memberRepository.insertMember(member);
	}

	@Override
	public User authenticateUser(User member) {

		User userInfo = memberRepository.selectMemberForAuth(member.getUserId());
		System.out.println(userInfo);
		System.out.println(member);
		if(userInfo == null || 
				!passwordEncoder.matches(member.getUserPwd(), userInfo.getUserPwd())) {
			System.out.println("????");
			return null;
		}
		return userInfo;
	}
	

}