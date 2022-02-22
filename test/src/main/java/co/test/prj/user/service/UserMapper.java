package co.test.prj.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	List<UserVO> userSelectList();

	UserVO userSelect(UserVO user);

	int userInsert(UserVO user);

	int userUpdate(UserVO user);

	int userDelete(UserVO user);

	boolean isIdCheck(String user_email);

	List<UserVO> userSearch(@Param("key") String key, @Param("data") String data);

	UserVO userOne(String user_email);
}
