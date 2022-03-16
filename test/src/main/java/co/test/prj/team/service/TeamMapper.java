package co.test.prj.team.service;

import java.util.List;

public interface TeamMapper {
	List<TeamVO> teamSelect(TeamVO team);
	
	List<TeamVO> myProjectList(TeamVO team);

	int teamInsert(TeamVO team);

	int teamUpdate(TeamVO team);

	int teamDelete(TeamVO team);
	
	List<TeamVO> jobDetailSelect(TeamVO team);
	
	//은덕 프로젝트 등록시 마스터 등록
	int teamMasterInsert(TeamVO team);
}
