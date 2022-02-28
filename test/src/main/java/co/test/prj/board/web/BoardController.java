package co.test.prj.board.web;

import java.util.List;

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
	
	@RequestMapping("/freeBoard")
	public String freeBoard(Model model) {
		List<BoardVO> list=boardDao.boardFreeList();
		List<UserVO> lis=userDao.userSelectList();
		model.addAttribute("frees",list);
		model.addAttribute("users",lis);
		return "board/boardList";
	}
	@RequestMapping("/freeboardSelect")
	public String freeboardSelect(Model model,int id) {
		BoardVO vo=new BoardVO();
		vo.setBrd_id(id);
		vo=boardDao.boardSelect(vo);
		List<UserVO> lis=userDao.userSelectList();
		
		model.addAttribute("board",vo);
		model.addAttribute("users",lis);
		return "board/boardSelect";
	}
}
