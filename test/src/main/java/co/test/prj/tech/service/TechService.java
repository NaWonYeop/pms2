package co.test.prj.tech.service;

import java.util.List;

import co.test.prj.application.service.AppVO;
import co.test.prj.interest.service.InterestVO;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.star.service.StarVO;
import co.test.prj.team.service.TeamVO;
import co.test.prj.user.service.UserVO;

public interface TechService {
	List<TechVO> techSelectList();
	
	List<TechVO> jobSelectList();
	
	//찜목록들
	List<TechVO> jobInterList(int user_id);
	
	List<TechVO> techSelect(TechVO tech);

	int techInsert(TechVO tech);

	int techUpdate(TechVO tech);

	int techDelete(TechVO tech);

	// 프로젝트 참여
	List<ProjectVO> jobJoinList(ProjectVO project);
	
	//찜하기 버튼 체크
	InterestVO heartbtnCheck(InterestVO inter);

	// 확정멤버 리스트
	List<UserVO> memberList(ProjectVO project);
	
	// 구인현황 참여 요청 리스트
	List<ProjectVO> ofterList(ProjectVO project);
		
	// 구인현황 프로젝트 신청 리스트
	List<ProjectVO> offerFromPrj(ProjectVO project);
	
	//관심 리스트
	List<TechVO> interestList(TechVO tech);
	
	//신청수락
	int ofterAcceptUpdate(AppVO app);
	int ofterAcceptInsert(TeamVO team);
	
	//관심수락
	int heartAccept(AppVO app);
	
	//관심거절
	int heartDelete(InterestVO interest);
	
	//평가
	List<TechVO> AssessList(ProjectVO vo);
	
	//평가 insert
	int AssessInsert(StarVO star);
	
	//평가 update
	int AssessUpdate(StarVO star);
	
	//검색 2개
	
	List<TechVO> jobNameSer(String user_name);
	List<TechVO> jobTitleSer(String user_job_ttl);
	
	AppVO projectOfrAppend(AppVO app);
	
	//InsertPage title Check
	UserVO ttlCheck(UserVO user);
}
