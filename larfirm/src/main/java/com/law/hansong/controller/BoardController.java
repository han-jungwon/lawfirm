package com.law.hansong.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.law.hansong.common.CommonUtil;
import com.law.hansong.dto.Board;
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
	public ModelAndView searchDetail(ModelAndView mv, @RequestParam(value = "id", required =  true) Long id) {
		Map<String, Object> returnMap = boardService.searchDetail(id);

		
		mv.addObject("board", returnMap.get("board"));
		mv.addObject("boardFileList", returnMap.get("boardFileList"));
		mv.addObject("commentsList", returnMap.get("commentsList"));
		mv.addObject("comments", returnMap.get("comments"));
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
		
		log.info("컨트롤러");
		
		redirect.addAttribute("BOARD_CATEGORY", board.getBoard_category());
		return "redirect:/boards/boardList";
	 }

	 // 썸머노트 이미지
	@PostMapping("/summerImage")
	@ResponseBody
	public void summerImage(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
		 					throws Exception {
			response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String fileName = file.getOriginalFilename();
		String serverFileName = CommonUtil.gm_fileDbName(fileName,filePath);

		File f = new File(filePath);
		if(!f.exists()) {
			f.mkdirs();
		}

		file.transferTo(new File(filePath + serverFileName));
		out.print("/hansong/resources/upload"+serverFileName);
		out.close();
	}


	// 게시판 수정 폼
	@GetMapping("/boardUpdateView")
	public ModelAndView boardUpdateView(ModelAndView mv, Long id) {
		Map<String, Object> returnMap = boardService.selectUpdateBoard(id);

		mv.addObject("board", returnMap.get("board"));
		mv.addObject("boardFileList", returnMap.get("fileList"))

		.setViewName("board/boardUpdate");
		return mv;
	}
	
	
	// 게시판 수정
	@PostMapping("/boardUpdate")
	public String boardUpdate(Board board, @RequestParam("CHANGE_FILE") int changeFile, RedirectAttributes redirect,
			 ModelAndView mv, HttpServletResponse response, HttpServletRequest request) throws Exception {
		log.info(board.toString());
		boardService.updateBoard(board,changeFile, filePath);
		
		redirect.addAttribute("id",board.getId());
		mv.addObject("boardFileList", "boardFileList");;
		return "redirect:/boards/boardView";
		
		
	}
	
	  
	// 게시판 이미지 다운로드
		@GetMapping("boardFileDown")
		public void BoardFileDown(String filename, HttpServletRequest request, String original, HttpServletResponse response) throws Exception {
			ServletContext context = request.getSession().getServletContext();
					
			String sFilePath = filePath +"/"+filename;
			
			byte b[] = new byte[4096];
			// sFilePath에 있는 파일의 MimeType을 구해온다.
			String sMimeType = context.getMimeType(sFilePath);
			System.out.println("sMimeType>>>" + sMimeType);
			
			if(sMimeType == null)
				sMimeType = "application/octet-stream";
			
			response.setContentType(sMimeType);
			String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
			
			response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);
			
			
			try (
				BufferedOutputStream out2 = new BufferedOutputStream(response.getOutputStream());
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(sFilePath));) 
			{
				int numRead;
				while((numRead = in.read(b, 0, b.length)) != -1) {// 읽은 데이터가 
					out2.write(b, 0, numRead);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		/*
		 * // 게시글 삭제
		 * 
		 * @PostMapping("/boardDelete") public String boardDelete(int id,
		 * HttpServletRequest request, RedirectAttributes redirect) {
		 * 
		 * 
		 * Board board = boardService.selectUpdateBoard(id); // 수정페이지로 들어가서
		 * 
		 * // 게시글에 파일첨부가 되어있으면 -> 파일을 삭제해준다. if(board.getUploadFile() != null) {
		 * deleteFile(board.getUploadFile(),request); }
		 * 
		 * // 게시글을 삭제한다. int result = boardService.deleteBoard(id);
		 * 
		 * return "redirect:/boards/boardList"; }
		 */
		
		//게시물 삭제
		@GetMapping("/deleteBoard") 
		public String deleteBoard(Long id, HttpServletRequest request) {

			int result = boardService.deleteBoard(id);
			
	
				return "redirect:/boards/boardList";
			
		}
		 
		 
		public void deleteFile(List<MultipartFile> list, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\upload";
			
			File f = new File(savePath + "\\" + list); // 기존에 업로드된 파일의 실제경로를 이용해서 file객체생성
			
			if(f.exists()) {
				f.delete();
			}
		}

	}
		



