package co.test.prj.reply.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.test.prj.reply.service.ReplyService;
import co.test.prj.reply.service.ReplyVO;


@Controller
public class ReplyController
{
	@Autowired ReplyService replyDao;
	//목록불러오기
	@RequestMapping("replyList")
	@ResponseBody
	public List<ReplyVO> appSelectList(ReplyVO vo,HttpSession session, Model model) {
		
		List<ReplyVO> list = replyDao.replyProList(vo);
		System.out.println(list);
		return list;
	}
	//댓글 인서트 케이스로 이동위치 추가할것
	@RequestMapping("rplInsert")
	public String rplInsert(ReplyVO vo,String url)
	{
		replyDao.replyInsert(vo);
		switch (url)
		{
		case "freeBoard":
			return "redirect:/freeboardSelect?brd_id="+vo.getBrd_id();
		case "noticeBoard":
			return "redirect:/noticeboardSelect?brd_id="+vo.getBrd_id();
		}
		return "retirect:/home";
		
	}
	
	//단건삭제
	@RequestMapping("rplDelete")
	@ResponseBody
	public void rplDelete(int id)
	{
		ReplyVO vo= new ReplyVO();
		vo.setRpl_id(id);
		vo.setBrd_id(0);
		replyDao.replyDelete(vo);
		
	}
}
