package co.test.prj.pms.service;

import java.util.Date;

import lombok.Data;

@Data
public class PmsVO {
	// user
	private int user_id;
	private String user_email;
	private String user_pwd;
	private String user_name;
	private int user_tel;
	private String user_ath;
	private Date user_j_date;
	private int user_crr;
	private int user_age;
	private String user_job_ttl;
	private String user_job_cnt;
	private int user_type;
	private String ether_id;
	
	// team
	// private int user_id;
	private int prj_id;
	private String tm_pos;
	private int tm_sal;
	private String tm_dept;
	private int master_id;
}
