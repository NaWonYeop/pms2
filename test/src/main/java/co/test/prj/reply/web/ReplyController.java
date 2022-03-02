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
	
	@RequestMapping("replyList")
	@ResponseBody
	public List<ReplyVO> appSelectList(int brd_id,HttpSession session, Model model) {
		System.out.println(brd_id);
		ReplyVO vo=new ReplyVO();
		vo.setBrd_id(brd_id);
		List<ReplyVO> list = replyDao.replyProList(vo);
		return list;
	}
	
	@RequestMapping("rplInsert")
	public String rplInsert(ReplyVO vo)
	{
		replyDao.replyInsert(vo);
		return "redirect:/freeboardSelect?id="+vo.getBrd_id();
	}
}
