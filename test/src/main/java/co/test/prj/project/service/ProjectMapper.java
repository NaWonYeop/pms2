package co.test.prj.project.service;

import java.util.List;


public interface ProjectMapper {
	List<ProjectVO> projectSelectList();
	ProjectVO projectSelect(ProjectVO project);
	int projectInsert(ProjectVO project);
	int projectUpdate(ProjectVO project);
	int projectDelete(ProjectVO project);
	
	int projectMaxPId();
	
	//프로젝트 참여
	List<ProjectVO> jobJoinList(ProjectVO project);

	//구인현황 리스트
	List<ProjectVO> ofterList(ProjectVO project);

	
	//검색기능
	//List<ProjectVO> projectSearchList(ProjectVO project);
	
	//페이징
	//List<ProjectVO> projectPageList(ProjectVO project);
	
	//검색+페이징
	List<ProjectVO> projectSearchPageList(ProjectVO project);
		
	//검색+페이징 건수 확인
	int projectSearchPageCount(ProjectVO project);
	

}
