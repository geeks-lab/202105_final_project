package com.kh.eyes.teachable.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.eyes.teachable.model.vo.Teachable;

@Mapper
public interface TeachableRepository {
	
	@Insert("insert into teachable_que "
			+ "(que_data_idx, que_category, que_save_path, que_result, que_file_name, user_id) "
			+ "values('q'||sc_que_data_idx.nextval, #{queCategory}, "
			+ "#{queSavePath}, #{queResult}, #{queFileName}, #{userId})")
	int insertTeachable(Teachable teachable);
	
}
