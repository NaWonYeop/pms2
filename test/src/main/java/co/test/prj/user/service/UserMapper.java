package co.test.prj.user.service;

import java.util.List;

import co.test.prj.application.service.AppVO;
import co.test.prj.certificate.service.CertVO;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.team.service.TeamVO;


public interface UserMapper {
	List<UserVO> userSelectList();
	//로그인
	UserVO userSelect(UserVO user); 
	//회원가입
	int userInsert(UserVO user);
	//회원정보수정
	int userUpdate(UserVO user);
	//회원탈퇴
	int userDelete(UserVO user);
	//카카오톡아이디 중복체크
	boolean isIdCheck(String user_email);
	//일반 아이디 중복체크
	boolean nomalCheck(String user_email);
	//아아디찾기
	UserVO userSearch(UserVO user);
	//비밀번호찾기
	UserVO searchPwd(UserVO user);
	//비밀번호 변경
	int updatePwd(UserVO user);
	//프로젝트 목록
	List<ProjectVO> MyProject(UserVO user);
	//펀딩 목록
	List<ProjectVO> MyFunding(UserVO user);
	//알림 목록
	List<AppVO> MyApp(UserVO user);
	
	UserVO jobSelect(UserVO user);
	//비밀번호 확인
	UserVO checkPwd(UserVO user);
	//개발자 등록
	int insertDev(CertVO cert);
	//개발자 수정
	int deleteDev(CertVO cert);
	
	int AppUpdate(int user_id);
	
	//프로젝트관리페이지 
	List<ProjectVO> MyInsertProject(int master_id);
	
	List<ProjectVO> MyJoinProject(int user_id);
	
	//내펀딩리스트
	List<ProjectVO> MyfundingList(int user_id);
	//관리자 제외 전체유저뽑기
	List<UserVO> AdminUserList();
	
	UserVO userIdSelect(TeamVO vo);
}