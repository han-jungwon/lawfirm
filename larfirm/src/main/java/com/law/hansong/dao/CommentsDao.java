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
	public List<Comments> readComments(Long board_id) {
		return sqlSession.selectList("Comments.getList", board_id); 
	}

	// 댓글 작성
	public int insertComment(Comments co) {
		return sqlSession.insert("Comments.insertComment", co);
	}
	// 댓글 수정
	public int updateComment(Comments co) {
		return sqlSession.update("Comments.updateComment", co);
	}

	public int deleteComment(Long id) {
		return sqlSession.delete("Comments.deleteComment", id);
	}
	
	
	
}
