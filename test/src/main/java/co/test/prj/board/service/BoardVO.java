package co.test.prj.board.service;

import java.util.Date;

import lombok.Data;
@Data
public class BoardVO
{
	private int brd_id;
	private int user_id;
	private int prj_id;
	private String brd_ttl;
	private String brd_cnt;
	private Date brd_reg_date;
	private char brd_ntc_prop;
	
}
