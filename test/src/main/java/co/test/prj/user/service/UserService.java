package co.test.prj.user.service;

import java.util.List;



public interface UserService {
	List<UserVO> userSelectList();

	UserVO userSelect(UserVO user);
	
	int userInsert(UserVO user);

	int userUpdate(UserVO user);

	int userDelete(UserVO user);

	boolean isIdCheck(String user_email);

	List<UserVO> userSearch(String key, String data);

	UserVO userOne(String user_email);


}
