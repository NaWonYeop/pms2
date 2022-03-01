package co.test.prj.project.service;

import java.util.List;
public interface ProjectService {
	List<ProjectVO> projectSelectList();
	ProjectVO projectSelect(ProjectVO project);
	int projectInsert(ProjectVO project);
	int projectUpdate(ProjectVO project);
	int projectDelete(ProjectVO project);

	//오토와이어드 중복사용 알아내면 없앨꺼임
	int comtfInsert(ProjectVO project);
	int comtfCountMax();
}
