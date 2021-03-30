package com.kh.eyes.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.eyes.board.model.vo.Board;

public interface BoardService {
	
	Map<String,Object> selectBoardList(int page);
	
	void insertBoard(Board board, List<MultipartFile> files);
	
	Map<String,Object> selectBoardDetail(String bdIdx);
}
