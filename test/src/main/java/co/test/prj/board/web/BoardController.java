package co.test.prj.board.web;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.test.prj.board.service.BoardService;
import co.test.prj.board.service.BoardVO;
import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;

@Controller
public class BoardController
{
	@Autowired BoardService boardDao;
	@Autowired UserService userDao;
	//보드리스트
	@RequestMapping("/freeBoard")
	public String freeBoard(Model model) {
		List<BoardVO> list=boardDao.boardFreeList();
		List<UserVO> lis=userDao.userSelectList();
		model.addAttribute("frees",list);
		model.addAttribute("users",lis);
		return "board/boardList";
	}
	//보드단건
	@RequestMapping("/freeboardSelect")
	public String freeboardSelect(Model model,int id) {
		BoardVO vo=new BoardVO();
		vo.setBrd_id(id);
		vo=boardDao.boardSelect(vo);
		
		List<UserVO> lis=userDao.userSelectList();
		List<BoardVO> list=boardDao.boardFreeList();
		
		model.addAttribute("frees",list);
		model.addAttribute("board",vo);
		model.addAttribute("users",lis);
		return "board/boardSelect";
	}
	//인서트 화면
	@RequestMapping("/freeboardInsertform")
	public String freeboardInsertform(Model model,HttpSession session)
	{
		if(session.getAttribute("sessionUser")==null)
		{
			return "redirect:/freeBoard";
		}
		return "board/boardInsertform";
	}
	//인서트
	@RequestMapping("/freeboardInsert")
	public String freeboardInsert(BoardVO vo,Model model)
	{
		boardDao.boardInsert(vo);
		return "redirect:/freeBoard";
	}
	//업데이트 화면
	@RequestMapping("/freeboardUpdateform")
	public String freeboardUpdateform(int brd_id,Model model,HttpSession session)
	{
		if(session.getAttribute("sessionUser")==null)
		{
			return "redirect:/freeBoard";
		}
		BoardVO vo=new BoardVO();
		vo.setBrd_id(brd_id);
		vo=boardDao.boardSelect(vo);
		
		model.addAttribute("board",vo);
		return "board/boardUpdateform";
	}
	//업데이트
	@RequestMapping("/freeboardUpdate")
	public String freeboardUpdate(BoardVO vo,Model model)
	{
		boardDao.boardUpdate(vo);
		return "redirect:/freeBoard";
	}
	//삭제
	@RequestMapping("/freeboardDelete")
	public String freeboardDelete(int brd_id,Model model,HttpSession session)
	{
		if(session.getAttribute("sessionUser")==null)
		{
			return "redirect:/freeBoard";
		}
		BoardVO vo=new BoardVO();
		vo.setBrd_id(brd_id);
		boardDao.boardDelete(vo);
		return "redirect:/freeBoard";
	}
}
