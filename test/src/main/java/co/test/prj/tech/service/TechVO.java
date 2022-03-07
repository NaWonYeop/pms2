package co.test.prj.tech.service;

import lombok.Data;

@Data
public class TechVO {
	private String tech_id;
	private int user_id2;
	private String tech_name;
	private String tech_fd;
	private int ctf_id;
	
	//구인현황
	private String user_name;
	private int user_crr;
	private int user_tel;
	private String app_stt;
	private int user_id;
}
