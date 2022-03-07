package co.test.prj.tech.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.application.service.AppVO;
import co.test.prj.interest.service.InterestVO;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.team.service.TeamVO;
import co.test.prj.tech.service.TechMapper;
import co.test.prj.tech.service.TechService;
import co.test.prj.tech.service.TechVO;

@Repository("techDao")
public class TechServiceImpl implements TechService {

	@Autowired
	private TechMapper map;

	@Override
	public List<TechVO> techSelectList() {
		return map.techSelectList();
	}

	@Override
	public List<TechVO> techSelect(TechVO tech) {
		return map.techSelect(tech);
	}

	@Override
	public int techInsert(TechVO tech) {
		return map.techInsert(tech);
	}

	@Override
	public int techUpdate(TechVO tech) {
		return map.techUpdate(tech);
	}

	@Override
	public int techDelete(TechVO tech) {
		return map.techDelete(tech);
	}

	@Override
	public List<ProjectVO> jobJoinList(ProjectVO project) {
		return map.jobJoinList(project);
	}

	@Override
	public List<ProjectVO> ofterList(ProjectVO project) {
		return map.ofterList(project);
	}

	@Override
	public List<TechVO> interestList(TechVO tech) {
		return map.interestList(tech);
	}

	@Override
	public int ofterAcceptUpdate(AppVO app) {
		return map.ofterAcceptUpdate(app);
	}

	@Override
	public int ofterAcceptInsert(TeamVO team) {
		return map.ofterAcceptInsert(team);
	}

	@Override
	public int heartDelete(InterestVO interest) {
		return map.heartDelete(interest);
	}

	@Override
	public int heartAccept(AppVO app) {
		return map.heartAccept(app);
	}

	@Override
	public List<TechVO> jobSelectList() {
		return map.jobSelectList();
	}

	
	
	
}
