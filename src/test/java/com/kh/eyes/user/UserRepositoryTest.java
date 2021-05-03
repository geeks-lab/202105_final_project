package com.kh.eyes.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.eyes.user.model.repository.UserRepository;
import com.kh.eyes.user.model.vo.User;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class UserRepositoryTest {
	
	@Autowired
	UserRepository repo;
	
	@Test
	public void insertUserTest() {
		User user = new User();
		user.setUserId("testUser2");
		user.setUserName("테스트");
		user.setUserPwd("1234");
		
		repo.insertUser(user);
	}
	
}
