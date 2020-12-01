package com.law.hansong.service;

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

	@Override
	public int commentInsert(Comments co) {
		int result = 0;
		result = commentsDao.commentInsert(co);
		if(result < 0) {
			throw new BusinessLogicException("댓글 작성 중 에러가 발생했습니다. 관리자에게 문의 바랍니다.", true);
		}
		return result;
	}

}
