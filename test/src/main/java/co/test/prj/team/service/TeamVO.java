package co.test.prj.team.service;

import lombok.Data;

@Data
public class TeamVO {
	private int user_id;
	private int prj_id;
	private String tm_pos;
	private int tm_sal;
	private String tm_dept;
}
