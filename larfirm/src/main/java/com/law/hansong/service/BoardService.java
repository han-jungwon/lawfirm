package com.law.hansong.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;



public interface BoardService {

	
	// 글 목록
	Map<String,Object> getBoardList(int page, int BOARD_CATEGORY);
	
	// 글 내용
	Map<String, Object>  getDetail(int id);

	// 게시글 추가
	void addBoard(Board board, String filePath) throws Exception;
	
	// 조회수 업데이트
	int readCountUpdate(int id);

	// 게시글 수정
	Board selectUpdateBoard(int id);
	int updateBoard(Board board);

	// 게시판 첨부파일 리스트
	List<BoardFile> getFileList(int id);
	
	

	

	

	
	
	
}
