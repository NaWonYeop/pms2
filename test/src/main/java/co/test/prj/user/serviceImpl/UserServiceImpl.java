package co.test.prj.user.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.application.service.AppVO;
import co.test.prj.certificate.service.CertVO;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.user.service.UserMapper;
import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService
{

	@Autowired
	private UserMapper map;

	@Override
	public List<UserVO> userSelectList()
	{

		return map.userSelectList();
	}

	@Override
	public UserVO userSelect(UserVO user)
	{

		return map.userSelect(user);
	}

	@Override
	public int userInsert(UserVO user)
	{

		return map.userInsert(user);
	}

	@Override
	public int userUpdate(UserVO user)
	{

		return map.userUpdate(user);
	}

	@Override
	public int userDelete(UserVO user)
	{

		return map.userDelete(user);
	}

	@Override
	public boolean isIdCheck(String user_email)
	{

		return map.isIdCheck(user_email);
	}

	@Override
	public UserVO userSearch(UserVO user)
	{
		return map.userSearch(user);
	}

	@Override
	public UserVO searchPwd(UserVO user)
	{

		return map.searchPwd(user);
	}

	@Override
	public int updatePwd(UserVO user)
	{
		
		return map.updatePwd(user);
	}

	@Override
	public UserVO jobSelect(UserVO user)
	{
		return map.jobSelect(user);
	}

	@Override
	public List<ProjectVO> MyProject(UserVO user)
	{
		return map.MyProject(user);
	}

	@Override
	public List<ProjectVO> MyFunding(UserVO user)
	{

		return map.MyFunding(user);
	}

	@Override
	public List<AppVO> MyApp(UserVO user)
	{
		return map.MyApp(user);
	}

	@Override
	public UserVO checkPwd(UserVO user)
	{

		return map.checkPwd(user);
	}

	@Override
	public List<ProjectVO> MyInsertProject(int master_id)
	{
		// TODO Auto-generated method stub
		return map.MyInsertProject(master_id);
	}

	@Override
	public List<ProjectVO> MyJoinProject(int user_id)
	{
		return map.MyJoinProject(user_id);
	}

	@Override
	public List<ProjectVO> MyfundingList(int user_id)
	{
		// TODO Auto-generated method stub
		return map.MyfundingList(user_id);
	}

	public int insertDev(CertVO cert)
	{
		return map.insertDev(cert);
	}

	@Override
	public int deleteDev(CertVO cert)
	{
		return map.deleteDev(cert);
	}

	@Override
	public boolean nomalCheck(String user_email) {
		return map.nomalCheck(user_email);
	}

	@Override
	public int AppUpdate(int user_id) {
		// TODO Auto-generated method stub
		return map.AppUpdate(user_id);
	}

	@Override
	public List<UserVO> AdminUserList() {
		// TODO Auto-generated method stub
		return map.AdminUserList();
	}

}
