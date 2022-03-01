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

	
	//오토와이어드 중복사용 알아내면 없앨꺼임
	@Override
	public int comtfInsert(ProjectVO project) {
		// TODO Auto-generated method stub
		return map.comtfInsert(project);
	}

	@Override
	public int comtfCountMax() {
		// TODO Auto-generated method stub
		return map.comtfCountMax();
	}

}
