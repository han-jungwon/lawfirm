package com.law.hansong.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;
import com.law.hansong.dto.Member;
import com.law.hansong.service.BoardService;
import com.law.hansong.service.MemberService;


@Controller
@RequestMapping("/boards")
public class BoardController {

	private Logger log = LoggerFactory.getLogger(getClass());

	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다.
	private final BoardService boardService;
	private final MemberService memberService;
	@Value("${filePath}")
	String filePath;


	public BoardController(BoardService boardService, MemberService memberService) {

		
		this.boardService = boardService;
		this.memberService = memberService;
	}
	


	@GetMapping("/counsel")
	public String counsel() {
		return "board/counsel";
	}

	@GetMapping("/agreement")
	public String agreement() {
		return "board/agreement";
	}

	@GetMapping("/apology")
	public String apology() {
		return "board/apology";
	}

	@GetMapping("/report")
	public String report() {
		return "board/report";
	}

	@GetMapping("/petition")
	public String petition() {
		return "board/petition";
	}


	// 게시글 목록 조회
	@GetMapping("/boardList")
	public ModelAndView boardList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "BOARD_CATEGORY", defaultValue = "0", required = false) int BOARD_CATEGORY,
			ModelAndView mv) throws Exception {

		Map<String, Object> resultMap = boardService.getBoardList(page, BOARD_CATEGORY);

		mv.setViewName("board/boardList");
		mv.addObject("page", page);
		mv.addObject("maxPage", resultMap.get("maxPage"));
		mv.addObject("startPage", resultMap.get("startPage"));
		mv.addObject("endPage", resultMap.get("endPage"));
		mv.addObject("listCount", resultMap.get("listCount"));
		mv.addObject("boardList", resultMap.get("boardList"));
		mv.addObject("limit", resultMap.get("limit"));
		mv.addObject("BOARD_CATEGORY", BOARD_CATEGORY);
		return mv;
	}


	// 게시글 상세보기
	@GetMapping("/boardView")
	public ModelAndView boardDetail(ModelAndView mv, int id) {

		Board board = boardService.getDetail(id);
		Member member  = memberService.getMemberByEmail(board.getRegi_id());
		
		List<BoardFile> boardFileList = boardService.getFileList(id);

		mv.addObject("board", board);
		mv.addObject("member",member);
		mv.addObject("boardFileList", boardFileList);
		mv.setViewName("board/boardView");
		return mv;
	}

	
	// 글쓰기 폼
	@GetMapping("/boardWrite")
	public ModelAndView boardWrite(@RequestParam(value = "BOARD_CATEGORY", defaultValue = "0", required = false) int BOARD_CATEGORY,
						 			HttpSession session, HttpServletResponse response, ModelAndView mv) throws Exception {
		mv.setViewName("board/boardAdd");
		mv.addObject("BOARD_CATEGORY", BOARD_CATEGORY);
		return mv;
	}


	// 게시판 글쓰기
	@PostMapping
	public String boardAddAction(Board board, RedirectAttributes redirect) throws Exception {
		boardService.addBoard(board, filePath);
		
		redirect.addAttribute("BOARD_CATEGORY", board.getBoard_category());
		return "redirect:/boards/boardList";
	 }

	
	// 게시판 수정 폼
	@GetMapping("/boardUpdateView")
	public ModelAndView boardUpdateView(ModelAndView mv, int id) {
		mv.addObject("board", boardService.selectUpdateBoard(id))
		.setViewName("board/boardUpdate");
		return mv;
	}
	
	
	// 게시판 수정
	@PostMapping("/boardUpdate")
	public ModelAndView boardUpdate(ModelAndView mv, Board board) {
		int result = boardService.updateBoard(board);
		
		if(result > 0) {
			mv.addObject("id", board.getRegi_id()).setViewName("redirect:board/boardView");
		}else {
			mv.addObject("msg", "수정실패").setViewName("common/errorPage");
		}
		return mv;
		
	}
	


	}
		



