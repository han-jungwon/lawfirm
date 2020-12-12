package com.law.hansong.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.law.hansong.dao.BoardDao;
import com.law.hansong.dao.CommentsDao;
import com.law.hansong.dto.Comments;
import com.law.hansong.exception.BusinessLogicException;

@Service
public class CommentsServiceImpl implements CommentsService{

	private Logger log = LoggerFactory.getLogger(getClass());
	
	private final CommentsDao commentsDao;


	public CommentsServiceImpl(CommentsDao commentsDao) {
		this.commentsDao = commentsDao;
	}

	// 댓글 등록
	@Override
	public int insertComment(Comments co) {

		int result = 0;
		result = commentsDao.insertComment(co);
		if(result < 0) {
			throw new BusinessLogicException("댓글 작성 중 에러가 발생했습니다. 관리자에게 문의 바랍니다.", true);
		}
		
		return result;
		
		
	}
	
	// 댓글 리스트
	@Override
	public List<Comments> searchComments(Long board_id) {
		return commentsDao.readComments(board_id);
		
	}

	// 댓글 수정
	@Override
	public int updateComment(Comments co) {
		return commentsDao.updateComment(co);
	}

	// 댓글 삭제
	@Override
	public int deleteComment(Long id) {
		return commentsDao.deleteComment(id);
	}

}
