package com.kh.eyes.board.controller;

import java.nio.charset.Charset;
import java.nio.file.FileSystems;
import java.util.List;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eyes.board.model.service.BoardService;
import com.kh.eyes.board.model.vo.Board;
import com.kh.eyes.common.util.file.FileVo;
import com.kh.eyes.user.model.vo.User;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private final BoardService boardService;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@GetMapping("list")
	public String boardList(@RequestParam(defaultValue = "1") int page, Model model) {
		model.addAllAttributes(boardService.selectBoardList(page));
		return "board/boardList";
	}
	
	@GetMapping("form")
	public String boardForm() {
		return "board/boardForm";
	}
	
	@PostMapping("upload")
	public String uploadBoard(
			@RequestParam List<MultipartFile> files
			,@SessionAttribute(name = "userInfo", required = false) User member
			,Board board) {
		
		//로그인 여부에 따른 예외처리
		String userId = member == null?"guest":member.getUserId();
		board.setUserId(userId);
		
		boardService.insertBoard(board, files);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("detail")
	public String boardDetail(String bdIdx, Model model) {
		model.addAllAttributes(boardService.selectBoardDetail(bdIdx));
		return "board/boardView";
	}
	
	@GetMapping("download")
	public ResponseEntity<FileSystemResource> downloadFile(FileVo file){
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDisposition(ContentDisposition
						.builder("attachment")
						.filename(file.getOriginFileName(), Charset.forName("utf-8"))
						.build());
		
		FileSystemResource resource = new FileSystemResource(
				FileSystems
				.getDefault()
				.getPath(file.getFullPath(), file.getRenameFileName()));
		
		return ResponseEntity.ok().headers(headers).body(resource);
	}
	
}
