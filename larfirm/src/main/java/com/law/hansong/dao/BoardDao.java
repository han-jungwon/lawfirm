package com.law.hansong.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.law.hansong.dto.Board;


@Repository
public class BoardDao {

	@Autowired
	   private SqlSessionTemplate sqlSession;
	
	// 게시글 목록 조회
	public List<Board> getBoardlist() {
		return sqlSession.selectList("Board.selectList");
	}
	
	
}
