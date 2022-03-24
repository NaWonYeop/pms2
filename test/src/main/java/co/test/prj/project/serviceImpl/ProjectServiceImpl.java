package co.test.prj.project.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.interest.service.InterestVO;
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
	public List<ProjectVO> projectSearchPageList(ProjectVO project) {
		return map.projectSearchPageList(project);
	}

	@Override
	public int projectSearchPageCount(ProjectVO project) {
		return map.projectSearchPageCount(project);
	}

	@Override
	public int projectView(ProjectVO project) {
		return map.projectView(project);
	}

	@Override
	public List<ProjectVO> mainOfrList() {
		// TODO Auto-generated method stub
		return map.mainOfrList();
	}

	@Override
	public List<ProjectVO> mainFndList() {
		// TODO Auto-generated method stub
		return map.mainFndList();
	}

	@Override
	public List<ProjectVO> projectAppList(ProjectVO project) {
		return map.projectAppList(project);
	}

	@Override
	public List<ProjectVO> projectRwdList(ProjectVO project) {
		return map.projectRwdList(project);
	}

	@Override
	public int projectHitUpdate(ProjectVO project) {
		return map.projectHitUpdate(project);
	}

	@Override
	public List<ProjectVO> projectInterst(ProjectVO vo)
	{
		// TODO Auto-generated method stub
		return map.projectInterst(vo);
	}

	@Override
	public InterestVO heartProject(InterestVO vo)
	{
		// TODO Auto-generated method stub
		return map.heartProject(vo);
	}

	@Override
	public List<ProjectVO> adminProjectSelectList() {
		return map.adminProjectSelectList();
	}

	
	

	

}
