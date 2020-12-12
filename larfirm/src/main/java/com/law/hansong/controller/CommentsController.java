
package com.law.hansong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import
org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.law.hansong.dto.Comments;
import com.law.hansong.service.BoardService;
import
com.law.hansong.service.CommentsService;

@Controller
@RequestMapping("/comments")
public class CommentsController {

	private Logger log = LoggerFactory.getLogger(getClass());

	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다. 
	private final CommentsService commentsService; 
	private final BoardService boardService; 


	public CommentsController(CommentsService commentsService, BoardService boardService) {

		this.commentsService = commentsService; 
		this.boardService = boardService;
	}

	
	// 댓글 목록
	  @GetMapping("/commentList")
	  @ResponseBody
	  public Object commentList(@RequestParam("board_id") Long board_id) throws Exception {
		  List<Comments> commentsList = commentsService.searchComments(board_id); 
		  Map<String,Object> map = new HashMap<String, Object>(); 
		  map.put("commentsList",commentsList); 
		  map.put("leng", commentsList.size()); 
		  return map; 
		  }

	
	// 댓글 등록
	@PostMapping("/commentInsert") 
	public void commentInsert(Comments co, HttpServletResponse response) throws Exception {
		int ok = commentsService.insertComment(co);
			
		response.getWriter().print(ok);
	}
	
	// 댓글 수정
	@PostMapping("/updateComment")
	public void updateComment(Comments co, HttpServletResponse response) throws Exception {
		int ok = commentsService.updateComment(co);
		response.getWriter().print(ok);
	}
	
	// 댓글 삭제
	@GetMapping("/deleteComment")
	public void deleteComment(@RequestParam("id") Long id, HttpServletResponse response) throws Exception {
		log.info("아이디" + id);
		int ok = commentsService.deleteComment(id);
		response.getWriter().print(ok);
	}

}
