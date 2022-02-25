package co.test.prj.user.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.user.service.UserMapper;
import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper map;
	
	@Override
	public List<UserVO> userSelectList() {
		
		return map.userSelectList();
	}

	@Override
	public UserVO userSelect(UserVO user) {
		
		return map.userSelect(user);
	}

	@Override
	public int userInsert(UserVO user) {
		
		return map.userInsert(user);
	}

	@Override
	public int userUpdate(UserVO user) {
		
		return map.userUpdate(user);
	}

	@Override
	public int userDelete(UserVO user) {
		
		return map.userDelete(user);
	}

	@Override
	public boolean isIdCheck(String user_email) {
		
		return map.isIdCheck(user_email);
	}


	
	@Override
	public UserVO userSearch(UserVO user) {
		return map.userSearch(user);
	}


}
