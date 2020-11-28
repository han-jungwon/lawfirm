package com.law.hansong.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.law.hansong.dao.MemberDao;
import com.law.hansong.dto.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.law.hansong.common.CommonUtil;
import com.law.hansong.dao.BoardDao;
import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;
import com.law.hansong.exception.BusinessLogicException;

@Service
public class BoardServiceImpl implements BoardService {
    private Logger log = LoggerFactory.getLogger(getClass());

    private final BoardDao boardDao;
    private final MemberDao memberDao;

    public BoardServiceImpl(BoardDao boardDao, MemberDao memberDao) {
        this.memberDao =  memberDao;
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

    
    // 게시글 작성하기
	@Override
	public void addBoard(Board board, String filePath)  {
        boardDao.addBoard(board);
		List<MultipartFile> upLoadFile = board.getUploadFile();
		for (MultipartFile mf : upLoadFile) {
			if(mf.getSize() == 0) {
				break;
			}
            String fileName = mf.getOriginalFilename(); // 원래 파일명
            String fileDBName = CommonUtil.gm_fileDbName(fileName, filePath);

			BoardFile boardFile = BoardFile.builder()
                    .board_id(board.getId())
                    .file_name(fileDBName)
                    .file_original(fileName)
                    .regi_id(board.getRegi_id())
                    .updt_id(board.getRegi_id())
                    .build();


            try {
				mf.transferTo(new File(filePath + fileDBName));
			} catch(Exception e) {
				throw new BusinessLogicException("파일 업로드 간 에러가 발생했습니다." ,true);
			}
			boardDao.fileInsert(boardFile);
		}
	}


	@Override 
	public int readCountUpdate(int id) { 
		return boardDao.readCountUpdate(id); 
	}


	@Override
	public Board selectUpdateBoard(int id) {
		return boardDao.getDetail(id);
	}


	// 게시글 수정
	@Override
	public int updateBoard(Board board) {
        return boardDao.updateBoard(board);
	}


	// 게시판 첨부파일 리스트
	@Override
	public List<BoardFile> getFileList(int id) {
		return boardDao.getFileList(id);
	}








}


















