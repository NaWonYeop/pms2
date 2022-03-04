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

	@Override
	public List<ProjectVO> jobJoinList(ProjectVO project) {
		return map.jobJoinList(project);
	}

	@Override
	public List<ProjectVO> ofterList(ProjectVO project) {
		return map.ofterList(project);
	}

	
	

	

}
