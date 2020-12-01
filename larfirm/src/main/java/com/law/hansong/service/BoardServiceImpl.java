package com.law.hansong.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.law.hansong.common.CommonUtil;
import com.law.hansong.dao.BoardDao;
import com.law.hansong.dao.CommentsDao;
import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;
import com.law.hansong.dto.Comments;
import com.law.hansong.exception.BusinessLogicException;
import com.law.hansong.exception.ObjectNotFoundException;

@Service
public class BoardServiceImpl implements BoardService {
    private Logger log = LoggerFactory.getLogger(getClass());

    private final BoardDao boardDao;
    private final CommentsDao commentsDao;

	
    public BoardServiceImpl(BoardDao boardDao, CommentsDao commentsDao) {
        this.boardDao = boardDao;
        this.commentsDao = commentsDao;
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
    public Map<String, Object> searchDetail(Long id) {

        if(updateReadCount(id)!=1)
            return null;

        Map<String, Object> returnMap = new HashMap<String, Object>();
        Board board = boardDao.searchDetail(id);
        if(board == null) {
            throw new ObjectNotFoundException("게시판 정보를 찾을 수 없습니다.",true);
        }
       
        List<BoardFile> fileList = boardDao.getFileList(id);
        List<Comments> commentsList = commentsDao.readComments(id);
        
        board.setBoard_comment(""+((commentsList == null) ? 0 : commentsList.size()));
        
        returnMap.put("board", board);
        returnMap.put("boardFileList", fileList);   
        returnMap.put("commentsList", commentsList);
        
        
        return returnMap;
    }

    
    // 게시글 작성하기
	@Override
	public void addBoard(Board board, String filePath) throws Exception{
        board.setBoard_content(CommonUtil.gm_xssFilter(board.getBoard_content()));
        int result = 0;
		result = boardDao.addBoard(board);
		if(result < 0) {
			throw new BusinessLogicException("게시글 작성 중 에러가 발생했습니다. 관리자에게 문의 바랍니다.", true);
		}
	
        log.info("보드서비스1");
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
				
			log.info("보드서비스2");

			mf.transferTo(new File(filePath + fileDBName));

			boardDao.fileInsert(boardFile);
		}
	}


	// 게시물 읽은 수
	@Override 
	public int updateReadCount(Long id) { 
		return boardDao.updateReadCount(id); 
	}


	@Override
	public Board selectUpdateBoard(Long id) {
		return boardDao.searchDetail(id);
	}


	// 게시글 수정
	@Override
	public void updateBoard(Board board, int changeFile, String filePath) throws Exception {
		int result = 0;
				
		result = boardDao.updateBoard(board);
		if(result < 0) {
			throw new BusinessLogicException("수정 중 에러가 발생했습니다. 관리자에게 문의 바랍니다.", true);
		}
		
		
		List<MultipartFile> upLoadFile = board.getUploadFile();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("id",board.getId());
		returnMap.put("filePath",filePath);
		
		if(changeFile == 1) { // 파일 변경
			
			result = boardDao.fileDelete(returnMap);
			if(result < 0) {
				throw new BusinessLogicException("수정 중 에러가 발생했습니다. 관리자에게 문의 바랍니다.(2)", true);
			}
			
			for(MultipartFile mf : upLoadFile) {
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
			    
			    mf.transferTo(new File(filePath + fileDBName));
			    
			    result = boardDao.fileInsert(boardFile);
			    if(result < 0) {
					throw new BusinessLogicException("수정 중 에러가 발생했습니다. 관리자에게 문의 바랍니다.(3)", true);
				}
		    
			}		
		}else if(changeFile == 2) { // 파일 삭제
			result = boardDao.fileDelete(returnMap);
			if(result < 0) {
				throw new BusinessLogicException("수정 중 에러가 발생했습니다. 관리자에게 문의 바랍니다.(2)", true);
			}
		}
			
	
	}


	// 게시판 첨부파일 리스트
	@Override
	public List<BoardFile> getFileList(Long id) {
		return boardDao.getFileList(id);
	}


	@Override
	public int deleteBoard(Long id) {
		return boardDao.deleteBoard(id);
	}




	
	  // 게시글 삭제




















}


















