package co.test.prj.board.service;

import java.util.List;

public interface BoardMapper
{
	List<BoardVO> boardProList(BoardVO vo);

	List<BoardVO> boardFreeList();
	
	List<BoardVO> boardSearchList(BoardVO vo);
	
	int boardSearchPageCount(BoardVO vo);

	BoardVO freeSelect(BoardVO vo);	
	
	BoardVO boardSelect(BoardVO vo);

	int boardInsert(BoardVO vo);

	int boardUpdate(BoardVO vo);

	int boardDelete(BoardVO vo);
	
	List<BoardVO> boardNameSer(String user_name);
	
	List<BoardVO> boardTitleSer(String brd_ttl);
}
