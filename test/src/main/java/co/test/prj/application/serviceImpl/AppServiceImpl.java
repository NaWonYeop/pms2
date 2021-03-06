package co.test.prj.application.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.application.service.AppMapper;
import co.test.prj.application.service.AppService;
import co.test.prj.application.service.AppVO;

@Repository("appDao")
public class AppServiceImpl implements AppService {

	@Autowired
	private AppMapper map;

	@Override
	public List<AppVO> appSelect(AppVO app) {
		// TODO Auto-generated method stub
		return map.appSelect(app);
	}

	@Override
	public int appInsert(AppVO app) {
		// TODO Auto-generated method stub
		return map.appInsert(app);
	}

	@Override
	public int appUpdate(AppVO app) {
		// TODO Auto-generated method stub
		return map.appUpdate(app);
	}

	@Override
	public int appDelete(AppVO app) {
		// TODO Auto-generated method stub
		return map.appDelete(app);
	}

	@Override
	public int appPrjInsert(AppVO app) {
		return map.appPrjInsert(app);
	}

	@Override
	public AppVO appOvlp(AppVO app) {
		// TODO Auto-generated method stub
		return map.appOvlp(app);
	}

	@Override
	public AppVO appliSelect(AppVO app) {
		return map.appliSelect(app);
	}

}
