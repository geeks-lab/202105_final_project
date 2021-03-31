package com.kh.eyes.board.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.eyes.board.model.vo.Board;
import com.kh.eyes.common.util.file.FileVo;
import com.kh.eyes.common.util.paging.Paging;

@Mapper
public interface BoardRepository {
	
	List<Board> selectBoardList(Paging paging);
	
	@Select("select count(*) from user_suggest")
	int selectContentCnt();
	
	@Insert("insert into user_suggest(sug_idx, sug_title, sug_content, sug_is_del, user_id)"
			+ " values('b'||sc_sug_idx.nextval,#{sugTitle},#{sugContent},#{sugIsDel},#{userId})")
	int insertBoard(Board board);
	
	int insertFile(FileVo fileVo);
	
	@Select("select * from user_suggest where sug_idx = #{sug_idx}")
	Board selectBoardWithSugIdx(String sugIdx);
	
	@Select("select * from user_file where f_type_idx = #{sug_idx}")
	List<FileVo> selectFileWithSugIdx(String sugIdx);
}
