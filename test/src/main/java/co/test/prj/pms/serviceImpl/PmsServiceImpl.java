package co.test.prj.pms.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.pms.service.ChartVO;
import co.test.prj.pms.service.PmsMapper;
import co.test.prj.pms.service.PmsService;
import co.test.prj.pms.service.PmsVO;

@Repository("pmsDao")
public class PmsServiceImpl implements PmsService {

	@Autowired
	private PmsMapper map;
	
	@Override
	public List<PmsVO> pmsTeamList(PmsVO pms) {
		return map.pmsTeamList(pms);
	}

	@Override
	public List<ChartVO> buyList(ChartVO chart) {
		// TODO Auto-generated method stub
		return map.buyList(chart);
	}

}
