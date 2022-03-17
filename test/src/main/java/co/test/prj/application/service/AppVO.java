package co.test.prj.application.service;

import java.util.Date;

import lombok.Data;

@Data
public class AppVO {
	private int app_id;			// app_pk
	private int master_id;		// 프로젝트 생성자
	private int prj_id;				// 프로젝트 pk
	private int user_id;			// 신청인
	private int app_clsfc;			// 0 구직 1 구인
	private String app_stt;		// ing : 신청중, ok : 승인, no: 거부

	private String user_name;// 유저명
	private String prj_name;
	private String app_invsb;
	
	private String user_email;
	private String user_pwd;
	private int user_tel;
	private String user_ath;
	private String user_crr;
	private String user_age;
	private String user_job_ttl;
	private String user_job_cnt;
	private String user_type;
	private String tech_name;
	private double avg;
	private String tm_dept;
	private Date user_j_date;

}
