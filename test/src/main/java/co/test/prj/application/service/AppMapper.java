package co.test.prj.application.service;

import java.util.List;

public interface AppMapper {
	List<AppVO> appSelectList();

	AppVO appSelect(AppVO app);

	int appInsert(AppVO app);

	int appUpdate(AppVO app);

	int appDelete(AppVO app);
}
