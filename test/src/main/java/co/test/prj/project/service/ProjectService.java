package co.test.prj.project.service;

import java.util.List;

import co.test.prj.interest.service.InterestVO;

public interface ProjectService {
	List<ProjectVO> projectSelectList();

	ProjectVO projectSelect(ProjectVO project);

	int projectInsert(ProjectVO project);

	int projectUpdate(ProjectVO project);

	int projectDelete(ProjectVO project);

	int projectMaxPId();


	//List<ProjectVO> projectSearchList(ProjectVO project);

	//List<ProjectVO> projectPageList(ProjectVO project);



	List<ProjectVO> projectSearchPageList(ProjectVO project);

	int projectSearchPageCount(ProjectVO project);
	
	int projectView(ProjectVO project);

	//원엽
	//메인페이지 뿌려줄 구인(프로젝트)리스트
	List<ProjectVO> mainOfrList();
	//메인페이지 뿌려줄 펀딩리스트
	List<ProjectVO> mainFndList();
	
	
	List<ProjectVO> projectAppList(ProjectVO project);
	
	List<ProjectVO> projectRwdList(ProjectVO project);
	
	int projectHitUpdate(ProjectVO project);
	//프로젝트 찜리스트
	List<ProjectVO> projectInterst(ProjectVO vo);
	
	InterestVO heartProject(InterestVO vo);
}
