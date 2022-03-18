package co.test.prj.report.service;

import java.util.List;

public interface ReportService {
	
	List<ReportVO> reportList();
	
	ReportVO reportSelect(ReportVO vo);
	
	int reportInsert(ReportVO vo);
	
	int reportUpdate(ReportVO vo);
	
	int reportDelete(ReportVO vo);
	
	
}
