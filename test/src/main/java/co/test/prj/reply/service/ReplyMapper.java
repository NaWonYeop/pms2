package co.test.prj.reply.service;

import java.util.List;

public interface ReplyMapper
{
List<ReplyVO> replyProList(ReplyVO vo);
	
	int replyInsert(ReplyVO vo);

	int replyUpdate(ReplyVO vo);

	int replyDelete(ReplyVO vo);
	
	int replyBrdDelete(ReplyVO vo);
}
