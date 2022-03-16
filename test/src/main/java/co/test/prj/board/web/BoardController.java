package co.test.prj.board.web;


import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<BoardVO> list= boardDao.boardFreeList();
		model.addAttribute("frees",list);
		return "board/boardList";
	}
	//보드단건
	@RequestMapping("/freeboardSelect")
	public String freeboardSelect(BoardVO vo,Model model) {
	
		vo=boardDao.freeSelect(vo);
		
		model.addAttribute("board",vo);
		return "board/boardSelect";
	}
	//인서트 화면
	@RequestMapping("/freeboardInsertform")
	public String freeboardInsertform(Model model,HttpSession session)
	{
		/*
		 * if(session.getAttribute("sessionUser")==null) { return "redirect:/freeBoard";
		 * }
		 */
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
	public String freeboardUpdateform(BoardVO vo,Model model,HttpSession session)
	{
		if(session.getAttribute("sessionUser")==null)
		{
			return "redirect:/freeBoard";
		}
		
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
	public String freeboardDelete(BoardVO vo,Model model,HttpSession session)
	{
		if(session.getAttribute("sessionUser")==null)
		{
			return "redirect:/freeBoard";
		}

		boardDao.boardDelete(vo);
		return "redirect:/freeBoard";
	}
	

	//검색
	@RequestMapping("/boardSearch")
	public String jobsearch(@RequestParam("type") String type,@RequestParam("keyword") String keyword,Model model,HttpSession session) {
		List<BoardVO> list=new ArrayList<BoardVO>();
		if(type.equals("nam"))
		{
			list= boardDao.boardNameSer(keyword);
		}
		else
		{
			list= boardDao.boardTitleSer(keyword);
		}
		model.addAttribute("frees",list);
		
		return "board/boardList";
	}
}
