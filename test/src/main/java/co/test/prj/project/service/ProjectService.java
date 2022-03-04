package co.test.prj.project.service;

import java.util.List;

public interface ProjectService {
	List<ProjectVO> projectSelectList();

	ProjectVO projectSelect(ProjectVO project);

	int projectInsert(ProjectVO project);

	int projectUpdate(ProjectVO project);

	int projectDelete(ProjectVO project);

	int projectMaxPId();

	List<ProjectVO> jobJoinList(ProjectVO project);

	List<ProjectVO> projectSearchList(ProjectVO project);

	List<ProjectVO> projectPageList(ProjectVO project);

	List<ProjectVO> projectSearchPageList(ProjectVO project);

	// 페이징 건수 확인
	int projectPageCount(ProjectVO project);

	// 검색+페이징 건수 확인
	int projectSearchPageCount(ProjectVO project);
}
