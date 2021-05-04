package com.kh.eyes.teachable;

import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.eyes.teachable.model.repository.TeachableRepository;
import com.kh.eyes.teachable.model.vo.Teachable;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class TeachableRepositoryTest {
	
	@Autowired
	TeachableRepository repo;
	
	@Test
	public void insertTeachableTest() {
		Teachable teachable = new Teachable();
		teachable.setQueCategory("식음료");
		teachable.setQueFileName(UUID.randomUUID().toString());
		teachable.setUserId("testUser");
		teachable.setQueResult("코코팜");
		teachable.setQueSavePath("2021/05/03/");
		
		for (int i = 0; i < 2; i++) {
			repo.insertTeachable(teachable);
		}
	}
	
	
}
