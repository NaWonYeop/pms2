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
	
	//경일
	private String prj_name;
	private Date prj_str;
	private Date prj_ed;
}
