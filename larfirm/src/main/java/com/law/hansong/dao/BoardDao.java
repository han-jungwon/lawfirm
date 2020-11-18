package com.law.hansong.dao;

import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.law.hansong.dto.Board;


@Repository
public class BoardDao {

	@Autowired
	   private SqlSessionTemplate sqlSession;



	// 게시글 갯수
	public int getListCount() {
		return sqlSession.selectOne("Board.getListCount");
	}
	// 게시글 목록
	public List<Board> getBoardList(Map<String, Object> map) {
		return sqlSession.selectList("Board.selectList",map);
	}
	// 게시글 조회수
	public int updateCount(int num) {
		return sqlSession.update("Board.readcount_update", num);
	}
	// 게시글 상세보기
	public Board getDetail(int id) {
		return sqlSession.selectOne("Board.getDetail", id);
	}


	

	
}
