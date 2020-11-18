package com.law.hansong.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.law.hansong.dto.Board;
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






	/*
	 * // 게시판 상세 보기
	 *
	 * @GetMapping("/board_view_action")
	 * public ModelAndView Detail(int board_id, ModelAndView mv, HttpServletResponse response, HttpServletRequest request)
	 * throws Exception {
	 * Board board = boardService.getDetail(board_id);
	 * if (board == null) { response.setContentType("text/html;charset=utf-8");
	 * PrintWriter out = response.getWriter(); out.println("<script>");
	 * out.println("alert('삭제 또는 없는 게시물입니다.');"); out.println("history.go(-1);");
	 * out.println("</script>"); out.close(); } else {
	 *
	 * // 게시판정보, 회원 정보, 파일 리스트, 댓글 리스트 Member member =
	 * memberService.getUser(board.getRegi_id()); List<Board_file> board_file_list =
	 * boardService.get_file_list(board_id); //List<Comment> comment_list =
	 * comment_service.get_list(board_id); board.setMember_name(member.getName());
	 *
	 * //board.setBoard_comment(""+((comment_list == null) ?
	 * 0:comment_list.size()));
	 *
	 * mv.setViewName("board/board_view"); mv.addObject("board_file_list",
	 * board_file_list); //mv.addObject("comment_list", comment_list);
	 * mv.addObject("board_data", board);
	 *
	 * return mv; }
	 */



	@GetMapping("/board_add")
	public String board_add() {
		return "board/board_add";
	}

	/*
	 * // 게시판 글쓰기
	 * 
	 * @PostMapping("/board_add") public String board_add_action(Board board,
	 * RedirectAttributes redirect) throws Exception {
	 * 
	 * List<MultipartFile> uploadfile = board.getUploadfile(); int board_id =
	 * boardService.select_max_id(); board.setBOARD_ID(board_id);
	 * 
	 * boardService.insert_board(board); // 저장 메서드 호출 for (MultipartFile mf :
	 * uploadfile) { if(mf.getSize() == 0) { break; } Board_file board_file = new
	 * Board_file(); String fileName = mf.getOriginalFilename(); // 원래 파일명
	 * board_file.setBOARD_FILE_ORIGINAL(fileName); // 원래 파일명 저장 String fileDBName =
	 * fileDBName(fileName, save_folder); mf.transferTo(new File(save_folder +
	 * fileDBName)); board_file.setBOARD_FILE(fileDBName);
	 * board_file.setBOARD_ID(board_id); boardService.insert_file(board_file); }
	 * memberservice.add_write_act(board.getMEMBER_ID(), 5);
	 * log_service.insert_log(new Member_log(board.getMEMBER_ID(), 0, board_id));
	 * redirect.addAttribute("BOARD_CATEGORY", board.getBOARD_CATEGORY()); return
	 * "redirect:/board_list"; }
	 * 
	 */
}
