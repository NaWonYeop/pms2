package co.test.prj.application.service;

import java.util.List;

public interface AppService {
	List<AppVO> appSelect(AppVO app);

	int appInsert(AppVO app);

	int appUpdate(AppVO app);

	int appDelete(AppVO app);
	
	int appPrjInsert(AppVO app);
	
	AppVO appliSelect(AppVO app);
	
	AppVO appOvlp(AppVO app);
}
