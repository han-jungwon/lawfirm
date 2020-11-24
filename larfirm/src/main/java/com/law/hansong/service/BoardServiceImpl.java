package com.law.hansong.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.law.hansong.dao.BoardDao;
import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;

@Service
public class BoardServiceImpl implements BoardService {
    private Logger log = LoggerFactory.getLogger(getClass());

    private final BoardDao boardDao;

    public BoardServiceImpl(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    
    // 게시글 리스트
    @Override
    public Map<String, Object> getBoardList(int page, int BOARD_CATEGORY) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        
   
        int limit = 10;

        // 갯수
        int listCount = boardDao.getListCount();

        // 총 페이지 수
        int maxPage = (listCount + limit -1) / limit;

        // 현재 페이지에 보여줄 시작 페이지 수
        int startPage = ((page -1) / 10) * 10 + 1;

        // 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30...)
        int endPage = startPage + 10 - 1;
       

        if(endPage > maxPage) {
            endPage = maxPage;
        }

        int startrow = (page - 1) * limit + 1;
        int endrow = startrow + limit - 1;

        
        paramMap.put("board_category", BOARD_CATEGORY);
        paramMap.put("start", startrow);
        paramMap.put("end", endrow);
        
        // 게시판 목록
        List<Board> boardList = boardDao.getBoardList(paramMap);
        
      
        // 반환 값
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("boardList", boardList);
        resultMap.put("maxPage", maxPage);
        resultMap.put("startPage", startPage);
        resultMap.put("endPage", endPage);
        resultMap.put("listCount", listCount);
        resultMap.put("limit", limit);
        

        return resultMap;

    }


    
    // 게시글 상세보기
    @Override
    public Board getDetail(int id) {
    if(readCountUpdate(id)!=1)
    	return null;
        return boardDao.getDetail(id);
    }


	@Override
	public void addBoard(Board board, String filePath) {
		List<MultipartFile> uploadfile = board.getUploadfile();
		for (MultipartFile mf : uploadfile) {
			if(mf.getSize() == 0) {
				break;
			}
			BoardFile boardFile = new BoardFile();
			String fileName = mf.getOriginalFilename(); // 원래 파일명
			boardFile.setFile_original(fileName); // 원래 파일명 저장
			String fileDBName = fileDBName(fileName, filePath);
			mf.transferTo(new File(filePath + fileDBName));
			boardFile.setFile_name(fileDBName);
			boardService.fileInsert(boardFile);
		}
		
		boardDao.addBoard(board);
		
	}


	@Override
	public void fileInsert(BoardFile boardFile) {
		boardDao.fileInsert(boardFile);
		
	}




	@Override 
	public int readCountUpdate(int id) { 
		System.out.println("리드카운트업뎃 : " + id);
		return boardDao.readCountUpdate(id); 
	}


}


















