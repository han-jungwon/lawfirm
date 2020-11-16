package com.law.hansong.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.law.hansong.dao.BoardDao;
import com.law.hansong.dto.Board;
import com.law.hansong.dto.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private BoardDao boardDao;


	@Override
	public int getListCount(int BOARD_CATEGORY) {
		return boardDao.getListCount();
	}



	@Override 
	public List<Board> getBoardList(int page, int limit, int BOARD_CATEGORY) {
	Map<String, Object> map = new HashMap<String, Object>();
	String field = ""; 
	String field2 = "";

	int startrow = (page-1)*limit+1;
	int endrow = startrow+limit-1;
	map.put("board_category", BOARD_CATEGORY); 
	map.put("field2", field2);
	map.put("field",field); 
	map.put("start", startrow); 
	map.put("end", endrow);
	System.out.println(map); 
	log.info(map.get("board_category").toString());

	return boardDao.getBoardList(map);

	}




	@Override
	public Board getDetail(int id) {
		return boardDao.getDetail(id);
	}


	
}


/*
 * @Override public int setReadCountUpdate(int num) { return
 * boardDao.set_readcount_update(num); }
 */














