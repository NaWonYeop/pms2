package co.test.prj.user.service;

import java.util.List;



public interface UserService {
	List<UserVO> userSelectList();

	UserVO userSelect(UserVO user);

	int userInsert(UserVO user);

	int userUpdate(UserVO user);

	int userDelete(UserVO user);

	boolean isIdCheck(String user_email);

	UserVO userSearch(UserVO user);

	UserVO searchPwd(UserVO user);

	int updatePwd(UserVO user);

	UserVO jobSelect(UserVO user);
	
	UserVO MyProject(UserVO user);

}
