
package com.law.hansong.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import
org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.law.hansong.dto.Comments;
import
com.law.hansong.service.CommentsService;

@Controller
@RequestMapping("/comments")
public class CommentsController {

	private Logger log = LoggerFactory.getLogger(getClass());

	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다. 
	private final CommentsService commentsService; 


	public CommentsController(CommentsService commentsService) {

		this.commentsService = commentsService; 
	}


	@PostMapping("/commentInsert") 
	public void commentInsert(Comments co) throws Exception {
		log.info("commentInsert");

		int comment = commentsService.commentInsert(co);




	}

}
