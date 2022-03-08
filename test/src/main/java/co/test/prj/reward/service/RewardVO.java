package co.test.prj.reward.service;

import lombok.Data;

@Data
public class RewardVO {
	private int reward_id; //리워드 아이디 ,알아서들어감
	private int prj_id; //프로젝트 아이디
	private int master_id; //등록자 아이디
	private String rwd_name; //리워드 명
	private String rwd_cnt; //리워드 내용
	private int rwd_prc; //금액
	private int rwd_cot; //구입수량
	private int rwd_goal; //판매수량
	private int rwd_stt; //판매 여부
	
	 

}
