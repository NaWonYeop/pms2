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
import co.test.prj.team.service.MyPrjVO;
import co.test.prj.user.service.UserService;

@Controller
public class BoardController
{
	private static final BoardVO BoardVO = null;
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
		
		int test=vo.getBrd_ntc_prop();
		System.out.println(test);
		if(vo==null || test==49)
			return "redirect:/freeBoard";
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
	
	
	
	//일반공지
	@RequestMapping("/noticeBoard")
	public String noticeBoard(Model model) {
		List<BoardVO> list= boardDao.boardNoticeList();
		model.addAttribute("frees",list);
		
		return "notice/noticeList";
	}
	//일반 공지 상세
	@RequestMapping("/noticeboardSelect")
	public String noticeBoardSelect(BoardVO vo,Model model) {
	
		vo=boardDao.freeSelect(vo);
		System.out.println(vo);
		if(vo==null || vo.getBrd_ntc_prop()==48)
			return "redirect:/noticeBoard";
		model.addAttribute("board",vo);
		return "notice/noticeSelect";
	}
	//일반 공지 인서트폼
	@RequestMapping("/adminNoticeInsertform")
	public String adminNoticeInsertform(Model model,HttpSession session)
	{
		return "notice/noticeInsertform";
	}
	//일반 공지 인서트
	@RequestMapping("/adminNoticeInsert")
	public String adminNoticeInsert(BoardVO vo,Model model)
	{
		boardDao.boardInsert(vo);
		return "redirect:/noticeBoard";
	}
	//일반 공지 업데이트 화면
		@RequestMapping("/adminNoticeUpdateform")
		public String adminNoticeUpdateform(BoardVO vo,Model model,HttpSession session)
		{
			vo=boardDao.boardSelect(vo);
			
			model.addAttribute("board",vo);
			return "notice/noticeUpdateform";
		}
		//일반 공지 업데이트
		@RequestMapping("/adminNoticeUpdate")
		public String adminNoticeUpdate(BoardVO vo,Model model)
		{
			boardDao.boardUpdate(vo);
			return "redirect:/noticeBoard";
		}
		//일반 공지 삭제
		@RequestMapping("/adminNoticeDelete")
		public String adminNoticeDelete(BoardVO vo,Model model,HttpSession session)
		{
			boardDao.boardDelete(vo);
			return "redirect:/noticeBoard";
		}
	
	
	//pms 프로젝트 게시판
	@RequestMapping("/msboard")
	public String boardList(Model model,HttpSession session) {
		BoardVO vo = new BoardVO(); 
		MyPrjVO sp =(MyPrjVO)session.getAttribute("myPrj");
		vo.setPrj_id(String.valueOf(sp.getPrj_id()));
		List<BoardVO> list = boardDao.boardProjectList(vo);
		model.addAttribute("border", list);
		return "pms/board/projectboardList";
	}
	
	//프로젝트 단건조회
	@RequestMapping("/msprojectBoardSelect")
	public String projectboardSelect(BoardVO vo,Model model) {
		vo = boardDao.projectBoardSelect(vo);
		model.addAttribute("board",vo);
		return "pms/board/projectSelect";
	}
	
	//프로젝트게시판 입력
	@RequestMapping("/msprojectBoardInsertForm")
	public String projectboardInsertForm() {
		
		return "pms/board/projectboardInsertForm";
	}
	//입력2
	@RequestMapping("/msprojectBoardInsert")
	public String projectboardInsert(BoardVO vo, Model model, HttpSession session) {
		session.getAttribute("myPrj");
		boardDao.boardInsert(vo);
		return "redirect:/msboard";
	}
	//프로젝트게시판 삭제
	@RequestMapping("/msprojectBoardDelete")
	public String projectboardDelete(BoardVO vo,Model model,HttpSession session)
	{
		if(session.getAttribute("sessionUser")==null)
		{
			return "redirect:/msboard";
		}

		boardDao.boardDelete(vo);
		return "redirect:/msboard";
	}
	
	//업데이트 화면
		@RequestMapping("/msprojectboardUpdateform")
		public String projectboardUpdateform(BoardVO vo,Model model,HttpSession session)
		{
			if(session.getAttribute("sessionUser")==null)
			{
				return "redirect:/msboard";
			}
			
			vo=boardDao.boardSelect(vo);
			
			model.addAttribute("board",vo);
			return "pms/board/projectboardUpdateform";
		}
	
	//프로젝트게시판 업데이트
	@RequestMapping("/msprojectboardUpdate")
	public String projectboardUpdate(BoardVO vo,Model model)
	{
		boardDao.boardUpdate(vo);
		return "redirect:/msboard";
	}
	
	//pms 공지사항
		@RequestMapping("/msnotice")
		public String noticeList(Model model, HttpSession session) {
			BoardVO vo = new BoardVO();
			MyPrjVO no = (MyPrjVO)session.getAttribute("myPrj");
			vo.setPrj_id(String.valueOf(no.getPrj_id()));
			List<BoardVO> list = boardDao.boardNoticeProjectList(vo);
			model.addAttribute("notice", list);
			return "pms/board/noticeList";
		}
		
		//프로젝트 단건조회
		@RequestMapping("/msnoticeBoardSelect")
		public String noticeboardSelect(BoardVO vo,Model model) {
			vo = boardDao.projectBoardSelect(vo);
			model.addAttribute("board",vo);
			return "pms/board/noticeSelect";
		}
		//입력
		@RequestMapping("/msnoticeBoardInsertForm")
		public String noticeboardInsertForm() {
			
			return "pms/board/noticeboardInsertForm";
		}
		@RequestMapping("/msnoticeBoardInsert")
		public String noticeboardInsert(BoardVO vo, Model model, HttpSession session) {
			session.getAttribute("myPrj");
			boardDao.boardInsert(vo);
			return "redirect:/msnotice";
		}
		//삭제
		
		@RequestMapping("/msnoticeBoardDelete")
		public String noticeboardDelete(BoardVO vo,Model model,HttpSession session)
		{
			if(session.getAttribute("sessionUser")==null)
			{
				return "redirect:/msnotice";
			}

			boardDao.boardDelete(vo);
			return "redirect:/msnotice";
		}
		//업데이트
		@RequestMapping("/msnoticeboardUpdateform")
		public String noticeboardUpdateform(BoardVO vo,Model model,HttpSession session)
		{
			if(session.getAttribute("sessionUser")==null)
			{
				return "redirect:/msnotice";
			}
			
			vo=boardDao.boardSelect(vo);
			
			model.addAttribute("board",vo);
			return "pms/board/noticeboardUpdateform";
		}
		//업데이트
		@RequestMapping("/msnoticeboardUpdate")
		public String noticeboardUpdate(BoardVO vo,Model model)
		{
			boardDao.boardUpdate(vo);
			return "redirect:/msnotice";
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
