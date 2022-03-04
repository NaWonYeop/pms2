package co.test.prj.board.service;

import java.util.Date;

import lombok.Data;
@Data
public class BoardVO
{
	private int brd_id;
	private int user_id;
	private String prj_id;
	private String brd_ttl;
	private String brd_cnt;
	private Date brd_reg_date;
	private char brd_ntc_prop;
	
	private String user_name;
}
