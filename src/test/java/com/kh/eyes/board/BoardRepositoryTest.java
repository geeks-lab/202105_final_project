package com.kh.eyes.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.eyes.board.model.repository.BoardRepository;
import com.kh.eyes.board.model.vo.Board;

//가상으로 만들어지는 web.xml을 사용해 테스트 환경을 구축
@WebAppConfiguration
//JUnit의 실행 방법을 지정
//테스트 때 사용할 가상의 applicationContext를 생성하고 관리해준다.
@RunWith(SpringJUnit4ClassRunner.class)
//가상 applicationContext를 생성할 때 사용할 Spring bean 설정 파일의 위치를 지정
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class BoardRepositoryTest {
	
	@Autowired
	BoardRepository repo;
	
	@Test
	public void insertBoardTest() {
		Board board = new Board();
		board.setTitle("더미데이터");
		board.setContent("더미데이터입력");
		board.setUserId("tester");
		
		for (int i = 0; i < 107; i++) {
			repo.insertBoard(board);
		}
	}
}
