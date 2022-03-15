package co.test.prj.application.service;

import java.util.List;

public interface AppMapper {
	List<AppVO> appSelect(AppVO app);

	int appInsert(AppVO app);

	int appUpdate(AppVO app);

	int appDelete(AppVO app);
	
	//은덕 구인할때
	int appPrjInsert(AppVO app);
}
