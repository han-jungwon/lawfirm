package com.law.hansong.service;


import java.util.Map;

import com.law.hansong.dto.Board;



public interface BoardService {

	// 글 목록
	Map<String,Object> getBoardList(int page, int BOARD_CASTEGORY);
	
	// 글 내용
	Board getDetail(int id);

	int board_add(Board board);

	

	

	
	
	
}
