package com.law.hansong.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.law.hansong.dto.Board;
import com.law.hansong.service.BoardService;

import javafx.scene.control.Pagination;

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
    @GetMapping("/notice")
    public String notice() {
        return "board/notice";
    }
    @GetMapping("/petition")
    public String petition() {
        return "board/petition";
    }

    /*
    // 게시글 목록조회
    @GetMapping("/list")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value="currentPage"
			, required=false, defaultValue="1") int currentPage) {
		System.out.println(currentPage);
		
		int listCount = boardService.getListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("board/boardListView");
		return mv;
}*/

}
