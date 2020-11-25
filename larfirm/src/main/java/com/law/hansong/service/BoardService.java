package com.law.hansong.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;



public interface BoardService {

	
	// 글 목록
	Map<String,Object> getBoardList(int page, int BOARD_CATEGORY);
	
	// 글 내용
	Board getDetail(int id);

	// 게시글 추가
	void addBoard(Board board, String filePath);
	
	// 조회수 업데이트
	int readCountUpdate(int id);

	// 게시글 수정
	Board selectUpdateBoard(int id);
	int updateBoard(Board board);
	
	

	

	

	
	
	
}
