package com.law.hansong.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;
import com.law.hansong.service.BoardService;


@Controller
@RequestMapping("/boards")
public class BoardController {

	private Logger log = LoggerFactory.getLogger(getClass());

	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다.
	private final BoardService boardService;
	@Autowired
    Environment env;


	public BoardController(BoardService boardService) {

		this.boardService = boardService;
	}
	
	@Value("${savefoldername}")
	private String save_folder;

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
	@GetMapping("/board_list")
	public ModelAndView boardList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "BOARD_CATEGORY", defaultValue = "0", required = false) int BOARD_CATEGORY,
			ModelAndView mv) throws Exception {

		Map<String, Object> resultMap = boardService.getBoardList(page, BOARD_CATEGORY);

		mv.setViewName("board/board_list");
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
	@GetMapping("/board_view")
	public ModelAndView boardDetail(ModelAndView mv, int id) {

		Board board = boardService.getDetail(id);

		if (board != null) {
			mv.addObject("board", board)
			.setViewName("board/board_view");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}


	@GetMapping("/board_write")
	public ModelAndView boardWrite(@RequestParam(value = "BOARD_CATEGORY", defaultValue = "0", required = false) int BOARD_CATEGORY,
						 			HttpSession session, HttpServletResponse response, ModelAndView mv) throws Exception {
		mv.setViewName("board/board_add");
		mv.addObject("BOARD_CATEGORY", BOARD_CATEGORY);
		return mv;
	}


	// 게시판 글쓰기

	@PostMapping
	public String boardAddAction(Board board, RedirectAttributes redirect
									) throws Exception {
		boardService.addBoard(board, env.getProperty("savefoldername"));

		redirect.addAttribute("BOARD_CATEGORY", board.getBoard_category());
		return "redirect:/boards/board_list";
	 }

	


	}
		



