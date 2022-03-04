package co.test.prj.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.board.service.BoardMapper;
import co.test.prj.board.service.BoardService;
import co.test.prj.board.service.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService
{
	@Autowired BoardMapper map;
	

	@Override
	public BoardVO boardSelect(BoardVO vo)
	{
		// TODO Auto-generated method stub
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo)
	{
		// TODO Auto-generated method stub
		return map.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo)
	{
		// TODO Auto-generated method stub
		return map.boardUpdate(vo);
	}

	@Override
	public int boardDelete(BoardVO vo)
	{
		// TODO Auto-generated method stub
		return map.boardDelete(vo);
	}

	@Override
	public List<BoardVO> boardProList(BoardVO vo)
	{
		// TODO Auto-generated method stub
		return map.boardProList(vo);
	}

	@Override
	public List<BoardVO> boardFreeList()
	{
		// TODO Auto-generated method stub
		return map.boardFreeList();
	}

	@Override
	public BoardVO freeSelect(BoardVO vo)
	{
		// TODO Auto-generated method stub
		return map.freeSelect(vo);
	}

}
