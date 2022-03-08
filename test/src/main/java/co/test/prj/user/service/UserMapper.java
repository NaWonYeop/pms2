package co.test.prj.user.service;

import java.util.List;

import co.test.prj.application.service.AppVO;
import co.test.prj.certificate.service.CertVO;
import co.test.prj.project.service.ProjectVO;


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
	//아이디 중복체크
	boolean isIdCheck(String user_email);
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
	
	//프로젝트관리페이지 
	List<ProjectVO> MyInsertProject(int master_id);
	
	List<ProjectVO> MyJoinProject(int user_id);
	
}