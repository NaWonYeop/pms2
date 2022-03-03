package co.test.prj.team.service;

import java.util.List;

public interface TeamService {
	List<TeamVO> teamSelect(TeamVO team);

	List<TeamVO> myProjectList(TeamVO team);

	int teamInsert(TeamVO team);

	int teamUpdate(TeamVO team);

	int teamDelete(TeamVO team);
}
