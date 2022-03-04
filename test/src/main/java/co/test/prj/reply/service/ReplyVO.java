package co.test.prj.reply.service;

import java.util.Date;

import lombok.Data;
@Data
public class ReplyVO
{
	private int rpl_id;
	private int user_id;
	private int brd_id;
	private String rpl_cnt;
	private Date rpl_reg_date;
	
	private String user_name;
	private String rpl_date_string;
}
