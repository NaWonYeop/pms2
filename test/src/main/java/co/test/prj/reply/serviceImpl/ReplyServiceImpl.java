package co.test.prj.reply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.reply.service.ReplyMapper;
import co.test.prj.reply.service.ReplyService;
import co.test.prj.reply.service.ReplyVO;

@Repository("replyDao")
public class ReplyServiceImpl implements ReplyService
{
	@Autowired ReplyMapper map;

	@Override
	public List<ReplyVO> replyProList(ReplyVO vo)
	{
		// TODO Auto-generated method stub
		return map.replyProList(vo);
	}

	@Override
	public int replyInsert(ReplyVO vo)
	{
		// TODO Auto-generated method stub
		return map.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo)
	{
		// TODO Auto-generated method stub
		return map.replyUpdate(vo);
	}

	@Override
	public int replyDelete(ReplyVO vo)
	{
		// TODO Auto-generated method stub
		return map.replyDelete(vo);
	}

	@Override
	public int replyBrdDelete(ReplyVO vo)
	{
		// TODO Auto-generated method stub
		return map.replyBrdDelete(vo);
	}
	

	
}
