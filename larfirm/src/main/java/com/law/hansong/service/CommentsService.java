package com.law.hansong.service;

import java.util.List;

import com.law.hansong.dto.Comments;

public interface CommentsService {

	int insertComment(Comments co);

	List<Comments> searchComments(Long board_id);

	int updateComment(Comments co);

	int deleteComment(Long id); 

}
