package com.kh.eyes.user.model.repository;

import org.apache.ibatis.annotations.Insert;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.eyes.user.model.vo.User;

@Mapper
public interface UserRepository {
	
	@Select("select * from user_info where user_id = #{userId}")
	User selectUserById(String userId);
	
	@Select("select * from user_info where user_id = #{userId}")
	User selectUserForAuth(String userId);
	
	@Select("select count(*) from user_info where user_name = #{userName}")
	int selectUserByUserName(String userName);
	
	@Insert("insert into user_info(user_id,user_pwd,user_name)"
			+ " values(#{userId},#{userPwd},#{userName})")
	int insertUser(User user);
	
	//회원가입 
	public void join(User user);
	
	//아이디 중복검사
	public int idCheck(String userId);
}