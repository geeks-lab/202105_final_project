package com.kh.eyes.user.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.eyes.user.model.vo.User;

@Mapper
public interface UserRepository {
	
	@Select("select * from tb_member where user_id = #{userId}")
	User selectMemberById(String userId);
	
	@Select("select * from tb_member where user_id = #{userId} and is_leave = 0")
	User selectMemberForAuth(String userId);
	
	@Select("select count(*) from tb_member where email = #{email}")
	int selectMemberByEmail(String email);
	
	@Select("select count(*) from tb_member where tell = #{tell}")
	int selectMemberByTell(String tell);
	
	@Insert("insert into tb_member(user_id,password,email,tell)"
			+ " values(#{userId},#{password},#{email},#{tell})")
	int insertMember(User member);
}
