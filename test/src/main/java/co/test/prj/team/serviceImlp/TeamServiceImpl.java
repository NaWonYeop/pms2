package co.test.prj.team.serviceImlp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.team.service.TeamMapper;
import co.test.prj.team.service.TeamService;
import co.test.prj.team.service.TeamVO;

@Repository("teamDao")
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper map;

	@Override
	public List<TeamVO> teamSelectList() {
		// TODO Auto-generated method stub
		return map.teamSelectList();
	}

	@Override
	public List<TeamVO> teamSelect(TeamVO team) {
		// TODO Auto-generated method stub
		return map.teamSelect(team);
	}

	@Override
	public List<TeamVO> myProjectList(TeamVO team) {
		// TODO Auto-generated method stub
		return map.myProjectList(team);
	}

	@Override
	public int teamInsert(TeamVO team) {
		// TODO Auto-generated method stub
		return map.teamInsert(team);
	}

	@Override
	public int teamUpdate(TeamVO team) {
		// TODO Auto-generated method stub
		return map.teamUpdate(team);
	}

	@Override
	public int teamDelete(TeamVO team) {
		// TODO Auto-generated method stub
		return map.teamDelete(team);
	}

}
