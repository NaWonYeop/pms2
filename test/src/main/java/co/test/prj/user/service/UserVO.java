package co.test.prj.user.service;

import lombok.Data;

@Data
public class UserVO {

	private int user_id;
	private String user_email;
	private String user_pwd;
	private String user_name;
	private int user_tel;
	private String user_ath;
	private String user_crr;
	private String user_age;
	private String user_job_ttl;
	private String user_job_cnt;
	private String user_type;
	private String app_stt;
	private int app_id;
	private String tech_name;
	private double avg;
	private String tm_dept;
}
