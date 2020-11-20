package com.law.hansong.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.law.hansong.dto.Board;
import com.law.hansong.dto.Board_file;
import com.law.hansong.service.BoardService;


@Controller
@RequestMapping("/boards")
public class BoardController {

	private Logger log = LoggerFactory.getLogger(getClass());

	// 스프링 컨테이너가 생성자를 통해 자동으로 주입한다.
	private final BoardService boardService;


	public BoardController(BoardService boardService) {

		this.boardService = boardService;
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
	public String board_add() {
		return "board/board_add";
	}


	// 게시판 글쓰기

	@PostMapping("/board_add_action") 
	public String board_add_action(Board board, Board_file board_file, HttpServletRequest request,
									@RequestParam(name="uploadFile",required = false)MultipartFile file){

		  if(!file.getOriginalFilename().equals("")) { // 서버에 업로드 해야한다. String
		  renameFileName = saveFile(file,request);

		  if(renameFileName != null) { // 파일이 잘 저장된 경우
		  board_file.setFile_original(file.getOriginalFilename()); // 파일명만 DB에 저장
		  board_file.setFile_name(renameFileName);

		  }

		  }


		int result = boardService.board_add(board);
		if(result > 0) {
			return "redirect:board_list";
		}else {
			return "common/errorPage";
		}
		
	}
		


}
