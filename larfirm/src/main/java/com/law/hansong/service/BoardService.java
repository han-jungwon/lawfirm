package com.law.hansong.service;


import java.util.Map;

import com.law.hansong.dto.Board;



public interface BoardService {


	// 글 갯수
	int getListCount(int BOARD_CATEGORY);

	// 글 목록
	public Map<String,Object>getBoardList(int page, int limit, int BOARD_CASTEGORY);
	
	// 글 내용
	Board getDetail(int id);

	

	

	
	
	// 조회수 업데이트
	//int updateCount(int num);
	
}
