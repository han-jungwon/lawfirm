package com.law.hansong.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.law.hansong.dto.Comments;

@Repository
public class CommentsDao {
	
	@Autowired
	   private SqlSessionTemplate sqlSession;

	// 댓글 조회
	public List<Comments> readComments(Long id) {
		return sqlSession.selectList("Comments.getList", id); 
	}

	// 댓글 작성
	public int commentInsert(Comments co) {
		return sqlSession.insert("Comments.insertComment", co);
	}
	
	
	
}
