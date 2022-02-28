package co.test.prj.board.service;

import java.util.List;

public interface BoardMapper
{
	List<BoardVO> boardProList(BoardVO vo);

	List<BoardVO> boardFreeList();

	BoardVO boardSelect(BoardVO vo);

	int boardInsert(BoardVO vo);

	int boardUpdate(BoardVO vo);

	int boardDelete(BoardVO vo);
}
