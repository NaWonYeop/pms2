package co.test.prj.team.service;

import java.util.Date;

import lombok.Data;

@Data
public class TeamVO {
	private int user_id;
	private int prj_id;
	private String tm_pos;
	private int tm_sal;
	private String tm_dept;
	private int master_id;

	// 경일
	private String prj_name;
	private Date prj_str;
	private Date prj_ed;

	// user
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
	private Date user_j_date;
}
