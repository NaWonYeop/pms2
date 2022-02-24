package co.test.prj.user.service;

import lombok.Data;

@Data
public class UserVO {

	private int user_id;
	private String user_email;
	private String user_pwd;
	private String user_name;
	private int user_tel;

}
