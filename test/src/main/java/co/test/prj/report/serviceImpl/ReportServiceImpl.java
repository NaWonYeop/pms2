package co.test.prj.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.test.prj.report.service.ReportMapper;
import co.test.prj.report.service.ReportService;
import co.test.prj.report.service.ReportVO;

public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportMapper map;
	
	@Override
	public List<ReportVO> reportList() {
		// TODO Auto-generated method stub
		return map.reportList();
	}

	@Override
	public ReportVO reportSelect(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportSelect(vo);
	}

	@Override
	public int reportInsert(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportInsert(vo);
	}

	@Override
	public int reportUpdate(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportUpdate(vo);
	}

	@Override
	public int reportDelete(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportDelete(vo);
	}

}
