package com.kh.eyes.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.eyes.user.model.vo.User;

@Mapper
public interface MybatisRepository {
	
	//작성 기준 : 쿼리가 간단하면 어노테이션으로 처리
	// but join하거나 동적쿼리 사용시 mapper로 하는게 편함
	
	@Select("select * from tb_member where user_id = #{userId}")
	User selectOne(/* @Param(value = "userId") */ String userId);
	
	List<Map<String,Object>> selectListReturnedAsMap(String userId);
	
	@Select("select * from tb_member")
	List<User> selectList();
	
	@Insert("insert into tb_member(user_id,password,tell,email)" 
			+ "	values(#{userId},#{password},#{tell},#{email})")
	int insertWithVo(User member);
	
	@Insert("insert into tb_rent_master(rm_idx,user_id,title,rent_book_cnt)" 
			+ " values(sc_rm_idx.nextval,#{member.userId},#{title},#{rentBookCnt})")
	int insertWithMap(Map<String, Object> commandMap);
	
	@Update("update tb_member set password = #{password} where user_id = #{userId}")
	int update(User member);
	
	void procedure(String bIdx);
	
	List<Map<String,Object>> dynamicQueryIF(Map<String, Object> commandMap);
	
	List<Map<String,Object>> dynamicQueryChoose(Map<String, Object> commandMap);
	
	int dynamicQuerySetTag(User member);
		
	int dynamicQueryForeachTag(Map<String, Object> commandMap);
	
	List<User> dynamicQueryForeachTagWithList(List<String> list);
	
	List<Map<String,Object>> dynamicQueryWhereAndForeachTag(Map<String, Object> commandMap);
	
	Map<String,Object> resultMap(String userId);
	
	
	
}
