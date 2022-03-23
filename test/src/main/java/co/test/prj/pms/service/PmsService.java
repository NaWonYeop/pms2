package co.test.prj.pms.service;

import java.util.List;

public interface PmsService {
	List<PmsVO> pmsTeamList(PmsVO pms);
	
	List<ChartVO> buyList(ChartVO chart);
}
