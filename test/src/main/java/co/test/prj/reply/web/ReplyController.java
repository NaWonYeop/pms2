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
	public List<ReplyVO> appSelectList(ReplyVO vo,HttpSession session, Model model) {
		List<ReplyVO> list = replyDao.replyProList(vo);
		return list;
	}
}
