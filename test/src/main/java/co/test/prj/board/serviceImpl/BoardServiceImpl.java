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

	@Override
	public List<BoardVO> boardSearchList(BoardVO vo) {
		return map.boardSearchList(vo);
	}

	@Override
	public int boardSearchPageCount(BoardVO vo) {
		return map.boardSearchPageCount(vo);
	}

	@Override
	public List<BoardVO> boardNameSer(String user_name)
	{
		// TODO Auto-generated method stub
		return map.boardNameSer(user_name);
	}

	@Override
	public List<BoardVO> boardTitleSer(String brd_ttl)
	{
		// TODO Auto-generated method stub
		return map.boardTitleSer(brd_ttl);
	}

	@Override
	public List<BoardVO> boardProjectList() {
		
		return map.boardProjectList();
	}

	@Override
	public List<BoardVO> boardNoticeProjectList() {
		
		return map.boardNoticeProjectList();
	}

	@Override
	public BoardVO projectBoardSelect(BoardVO vo) {
		
		return map.projectBoardSelect(vo);
	}

	

}
