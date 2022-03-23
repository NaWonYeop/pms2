package co.test.prj.pms.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ChartVO {
	private int buy_id;
	private int user_id;
	private String buy_way;
	private String buy_stt;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date buy_date;
	private int reward_id;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date buy_rfnd_date;
	private int prj_id;
	private int buy_count;
	private String buy_muid;
	private int buy_won;
	private long buy_wei;
	private int buy_rfnd_won;
	private long buy_rfnd_wei;
	
	// private int reward_id; //리워드 아이디 ,알아서들어감
	// private int prj_id; //프로젝트 아이디
	private int master_id; //등록자 아이디
	private String rwd_name; //리워드 명
	private String rwd_cnt; //리워드 내용
	private int rwd_prc; //금액
	private int rwd_cot; //구입수량
	private int rwd_goal; //판매수량
	private int rwd_stt; //판매 여부
	
	private int prj_gl_prc; // 목표금액
}
