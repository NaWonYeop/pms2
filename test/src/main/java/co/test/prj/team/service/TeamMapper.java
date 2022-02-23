package co.test.prj.team.service;

import java.util.List;

public interface TeamMapper {
	List<TeamVO> teamSelectList();

	TeamVO teamSelect(TeamVO team);

	int teamInsert(TeamVO team);

	int teamUpdate(TeamVO team);

	int teamDelete(TeamVO team);
}
