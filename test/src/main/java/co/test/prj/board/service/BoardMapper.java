package co.test.prj.board.service;

import java.util.List;

public interface BoardMapper
{
	List<BoardVO> boardProList(BoardVO vo);

	List<BoardVO> boardFreeList();
	
	List<BoardVO> boardSearchList(BoardVO vo);
	
	List<BoardVO> boardProjectList(BoardVO vo);
	
	List<BoardVO> boardNoticeProjectList(BoardVO vo);
	
	BoardVO projectBoardSelect(BoardVO vo);
	
	int boardSearchPageCount(BoardVO vo);

	BoardVO freeSelect(BoardVO vo);	
	
	BoardVO boardSelect(BoardVO vo);

	int boardInsert(BoardVO vo);

	int boardUpdate(BoardVO vo);

	int boardDelete(BoardVO vo);
	
	List<BoardVO> boardNameSer(BoardVO vo);
	
	List<BoardVO> boardTitleSer(BoardVO vo);
	
	List<BoardVO> pmsNameSer(BoardVO vo);
	
	List<BoardVO> pmsTitleSer(BoardVO vo);
	
	List<BoardVO> boardNoticeList();
}
