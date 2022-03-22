package co.test.prj.buy.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BuyVO {
	private int buy_id;
	private int user_id; //구매자
	private String buy_way; //구매방법 cash, coin
	private String buy_stt; //상태 보관, 전달, 환불
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date buy_date;
	private int reward_id;
	private int prj_id; //프로젝트 아이디
	private int buy_count; //구매수량
	
	
	private String buy_muid; //상점 거래ID ~환불시 필요
	
	//환불
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date buy_rfnd_date; //환불날짜 
	private int buy_rfnd_prc; //환불금액
	
	
	//추가
	private int buy_won;
	private long buy_wei;
}
