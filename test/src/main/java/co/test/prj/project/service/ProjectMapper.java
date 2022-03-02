package co.test.prj.project.service;

import java.util.List;


public interface ProjectMapper {
	List<ProjectVO> projectSelectList();
	ProjectVO projectSelect(ProjectVO project);
	int projectInsert(ProjectVO project);
	int projectUpdate(ProjectVO project);
	int projectDelete(ProjectVO project);
	
	int projectMaxPId();
	
}
