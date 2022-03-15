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
	
	//검색필터
	private String type; //검색 타입
	private String keyword; //검색 내용
	
	//페이징
		private int pageNum; //현재 페이지
		private int amount;  //페이지에 보여줄 게시물 수 
		
		private int totalPage; //총 페이지 
}
