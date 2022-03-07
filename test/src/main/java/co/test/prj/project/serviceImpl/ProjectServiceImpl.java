package co.test.prj.project.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.project.service.ProjectMapper;
import co.test.prj.project.service.ProjectService;
import co.test.prj.project.service.ProjectVO;

@Repository("projectDao")
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectMapper map;

	@Override
	public List<ProjectVO> projectSelectList() {
		return map.projectSelectList();
	}

	@Override
	public ProjectVO projectSelect(ProjectVO project) {
		return map.projectSelect(project);
	}

	@Override
	public int projectInsert(ProjectVO project) {
		return map.projectInsert(project);
	}

	@Override
	public int projectUpdate(ProjectVO project) {
		return map.projectUpdate(project);
	}

	@Override
	public int projectDelete(ProjectVO project) {
		return map.projectDelete(project);
	}

	@Override
	public int projectMaxPId() {
		return map.projectMaxPId();
	}

//	@Override
//	public List<ProjectVO> projectSearchList(ProjectVO project) {
//		return map.projectSearchList(project);
//	}

//	@Override
//	public List<ProjectVO> projectPageList(ProjectVO project) {
//		return map.projectPageList(project);
//	}

	@Override
	public List<ProjectVO> projectSearchPageList(ProjectVO project) {
		return map.projectSearchPageList(project);
	}

	@Override
	public int projectSearchPageCount(ProjectVO project) {
		return map.projectSearchPageCount(project);
	}

	
	

	

}
