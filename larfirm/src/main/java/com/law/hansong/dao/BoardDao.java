package com.law.hansong.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.law.hansong.dto.Board;
import com.law.hansong.dto.PageInfo;



@Repository
public class BoardDao {

	@Autowired
	   private SqlSessionTemplate sqlSession;




	public int getListCount() {
		return sqlSession.selectOne("Board.getListCount");
	}

	/*
	 * public List<Board> getBoardList(PageInfo pi) { int offset =
	 * (pi.getCurrentPage() -1) * pi.getBoardLimit(); RowBounds rowBounds = new
	 * RowBounds(offset,pi.getBoardLimit());
	 * 
	 * return sqlSession.selectList("Board.selectList",null,rowBounds); }
	 */
	public int updateCount(int num) {
		return sqlSession.update("Board.readcount_update", num);
	}

	public Board getDetail(int id) {
		return sqlSession.selectOne("Board.getDetail", id);
	}

	public List<Board> getBoardList(Map<String, Object> map) {
		return sqlSession.selectList("Board.selectList",map);
	}
	
	

	
}
