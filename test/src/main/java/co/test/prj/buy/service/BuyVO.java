package co.test.prj.buy.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BuyVO {
	private int buy_id;
	private int user_id; //구매자
	private String buy_way; //구매방법 돈, 코인
	private String buy_stt; //입금확인중, 입금확인, 환불진행중, 환불확인
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date buy_date;
	private int reward_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date buy_rfnd_date;
	private int buy_rfnd_prc;
	private int buy_count;
}
