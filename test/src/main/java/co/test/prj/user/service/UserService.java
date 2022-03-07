package co.test.prj.user.service;

import java.util.List;

import co.test.prj.application.service.AppVO;
import co.test.prj.certificate.service.CertVO;
import co.test.prj.project.service.ProjectVO;




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
	
	UserVO checkPwd(UserVO user);
	
	CertVO insertDev(UserVO user);
	
	List<ProjectVO> MyProject(UserVO user);
	
	List<ProjectVO> MyFunding(UserVO user);
	
	List<AppVO> MyApp(UserVO user);

	List<ProjectVO> MyInsertProject(int master_id);
	
	List<ProjectVO> MyJoinProject(int user_id);
}
