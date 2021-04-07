package com.kh.eyes.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.eyes.user.model.vo.User;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class MybatisTest {
	
	@Autowired
	MybatisRepository mybatisRepository;
	private String userId = "PCLASS";
	
	@Test
	public void selectOne() {
		System.out.println(mybatisRepository.selectOne(userId));
	}
	
	@Test
	public void selectListReturnedAsMap() {
		mybatisRepository.selectListReturnedAsMap(userId);
	}
	
	@Test
	public void selectList() {
		mybatisRepository.selectList();
	}
	
	@Test
	public void insertWithVo() {
		User member = new User();
		member.setUserId("수업진짜");
		member.setUserPwd("하는중");
		member.setUserName("이머랭");
		mybatisRepository.insertWithVo(member);
	}
	
//	@Test
//	public void insertWithMap() {
//		Map<String, Object> commandMap = new HashMap<>();
//		User member = new User();
//		
//		member.setUserId(userId);
//		commandMap.put("member", member);
//		commandMap.put("title", "해리포터와 불사조 기사단 외 2권");
//		commandMap.put("rentBookCnt", 3);
//		mybatisRepository.insertWithMap(commandMap);
//	}
	
	@Test
	public void update() {
		User member = new User();
		member.setUserId(userId);
		member.setUserPwd("동해물과백두산이");
		mybatisRepository.update(member);
	}
	
//	@Test
//	public void procedure() {
//		String bIdx = "100511";
//		insertWithMap();
//		mybatisRepository.procedure(bIdx);
//	}
	
//	@Test
//	public void dynamicQueryIF() {
//		//사용자가 도서 검색 필터에서 info를 선택하고 검색하면 사용자가 입력한 키워드로 info 컬럼을 검색
//		//사용자가 도서 검색 필터에서 author를 선택하고 검색하면 사용자가 입력한 키워드로 author 컬럼을 검색
//		//사용자 선택 필터 : info
//		//사용자 입력 키워드 : 도시
//		
//		Map<String, Object> commandMap = new HashMap<String, Object>();
//		commandMap.put("searchType", "author");
//		commandMap.put("keyword", "도시");
//		mybatisRepository.dynamicQueryIF(commandMap);
//	}
	
//	@Test
//	public void dynamicQueryChoose() {
//		//사용자가 도서 검색 필터에서 info를 선택하고 검색하면 사용자가 입력한 키워드로 info 컬럼을 검색
//		//사용자가 도서 검색 필터에서 author를 선택하고 검색하면 사용자가 입력한 키워드로 author 컬럼을 검색
//		//사용자가 검색 필터를 지정하지 않을 경우 도서 제목으로 검색
//		//사용자 선택 필터 : info
//		//사용자 입력 키워드 : 도시
//		
//		Map<String, Object> commandMap = new HashMap<String, Object>();
//		commandMap.put("searchType", "title");
//		commandMap.put("keyword", "도시");
//		mybatisRepository.dynamicQueryChoose(commandMap);
//	}
	
	@Test
	public void dynamicQuerySetTag() {
		//사용자가 회원 수정란에서 수정한 내용을 update하는 쿼리를 작성
		//ex ) 사용자가 password, email만 수정했다면, update 쿼리를
		//	[update tb_member set password = 1234, email = 'aa@aa.com' where userId = 'aa']
		User member = new User();
		member.setUserId(userId);
		member.setUserName("이머랭");
		mybatisRepository.dynamicQuerySetTag(member);
	}
	
//	@Test
//	public void dynamicQueryForeachTag() {
//		//만능 insert 쿼리 생성
//		Map<String,Object> commandMap = new HashMap<String,Object>();
//		
//		Map<String,String> innerMap = new HashMap<String,String>();
//		innerMap.put("col", "b_idx");
//		innerMap.put("val", "sc_b_idx.nextval");
//		
//		Map<String,String> innerMap2 = new HashMap<String,String>();
//		innerMap2.put("title", "만능인서트에대한 3가지 고찰");
//		innerMap2.put("author", "피클래스");
//		innerMap2.put("info", "마이바티스의 동적쿼리를 활용하는 방법론");
//		
//		commandMap.put("table", "tb_book");
//		commandMap.put("primaryKey", innerMap);
//		commandMap.put("data", innerMap2);
//		mybatisRepository.dynamicQueryForeachTag(commandMap);
//	}
	
	@Test
	public void dynamicQueryForeachTagWithList() {
		List<String> list = new ArrayList<>();
		list.add("test");
		list.add("insertTest");
		list.add("insertTest2");
		mybatisRepository.dynamicQueryForeachTagWithList(list);
	}
	
//	@Test
//	public void dynamicQueryWhereAndForeachTag() {
//		//검색 조건을 or 연산으로 검색하기
//		//대출가능, 제목, 작가
//		String[] searchType = {"title", "author"};
//		
//		Map<String, Object> commandMap = new HashMap<String, Object>();
//		commandMap.put("searchType", searchType);
//		commandMap.put("keyword", "도시");
//		//Map.of("searchType", searchType, "keyword", "도시")
//		
//		mybatisRepository.dynamicQueryWhereAndForeachTag(commandMap);
//	}
	
	@Test
	public void resultMap() {
		System.out.println(mybatisRepository.resultMap(userId));
	}
	
}