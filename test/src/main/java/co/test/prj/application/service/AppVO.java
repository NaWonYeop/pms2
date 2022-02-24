package co.test.prj.application.service;

import lombok.Data;

@Data
public class AppVO {
	private int app_id;			// app_pk
	private int master_id;		// 프로젝트 생성자
	private int prj_id;				// 프로젝트 pk
	private int user_id;			// 신청인
	private char app_clsfc;		// 0 구직 1 구인
	private String app_stt;		// ing : 신청중, ok : 승인, no: 거부
}
