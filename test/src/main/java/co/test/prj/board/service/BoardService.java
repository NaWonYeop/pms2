package co.test.prj.board.service;

import java.util.List;


public interface BoardService
{
	List<BoardVO> boardProList(BoardVO vo);
	
	List<BoardVO> boardFreeList();
	
	List<BoardVO> boardSearchList(BoardVO vo);
	
	int boardSearchPageCount(BoardVO vo);
	
	BoardVO boardSelect(BoardVO vo);
	
	BoardVO freeSelect(BoardVO vo);
	
	int boardInsert(BoardVO vo);

	int boardUpdate(BoardVO vo);

	int boardDelete(BoardVO vo);
}
