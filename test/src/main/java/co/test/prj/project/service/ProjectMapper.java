package co.test.prj.project.service;

import java.util.List;


public interface ProjectMapper {
	List<ProjectVO> projectSelectList();
	ProjectVO projectSelect(ProjectVO project);
	int projectInsert(ProjectVO project);
	int projectUpdate(ProjectVO project);
	int projectDelete(ProjectVO project);
	
	int projectMaxPId();
	

	//검색기능
	//List<ProjectVO> projectSearchList(ProjectVO project);
	
	//페이징
	//List<ProjectVO> projectPageList(ProjectVO project);


	
	//검색+페이징
	List<ProjectVO> projectSearchPageList(ProjectVO project);
		
	//검색+페이징 건수 확인
	int projectSearchPageCount(ProjectVO project);
	
	//프로젝트 삭제(보이기만)
	int projectView(ProjectVO project);
	
	
	//원엽
	//메인페이지 뿌려줄 구인(프로젝트)리스트
	List<ProjectVO> mainOfrList();
	//메인페이지 뿌려줄 펀딩리스트
	List<ProjectVO> mainFndList();

}
