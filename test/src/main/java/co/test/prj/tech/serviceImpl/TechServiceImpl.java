package co.test.prj.tech.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.application.service.AppVO;
import co.test.prj.interest.service.InterestVO;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.star.service.StarVO;
import co.test.prj.team.service.TeamVO;
import co.test.prj.tech.service.TechMapper;
import co.test.prj.tech.service.TechService;
import co.test.prj.tech.service.TechVO;
import co.test.prj.user.service.UserVO;

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
	public List<UserVO> jobSelectList() {
		return map.jobSelectList();
	}

	@Override
	public List<TechVO> AssessList(ProjectVO vo) {
		return map.AssessList(vo);
	}

	@Override
	public int AssessInsert(StarVO star) {
		return map.AssessInsert(star);
	}

	@Override
	public int AssessUpdate(StarVO star) {
		return map.AssessUpdate(star);
	}

	@Override
	public List<UserVO> memberList(ProjectVO project) {
		return map.memberList(project);
	}

	@Override
	public InterestVO heartbtnCheck(InterestVO inter) {
		return map.heartbtnCheck(inter);
	}

	@Override
	public List<TechVO> jobInterList(int user_id)
	{
		return map.jobInterList(user_id);
	}

	@Override
	public List<TechVO> jobNameSer(String user_name)
	{
		return map.jobNameSer(user_name);
	}

	@Override
	public List<TechVO> jobTitleSer(String user_job_ttl)
	{
		return map.jobTitleSer(user_job_ttl);
	}

	@Override
	public List<ProjectVO> offerFromPrj(ProjectVO project) {
		return map.offerFromPrj(project);
	}

	@Override
	public AppVO projectOfrAppend(AppVO app) {
		return map.projectOfrAppend(app);
	}

	@Override
	public UserVO ttlCheck(UserVO user) {
		return map.ttlCheck(user);
	}

	@Override
	public UserVO insertUpdatebtnCheck(UserVO user) {
		return map.insertUpdatebtnCheck(user);
	}

	@Override
	public int ofterDelete(AppVO app) {
		return map.ofterDelete(app);
	}

	@Override
	public AppVO heartafterSelect(AppVO app) {
		return map.heartafterSelect(app);
	}

	@Override
	public List<UserVO> jobMainheartCheck(UserVO user) {
		return map.jobMainheartCheck(user);
	}

	
	
	
}
