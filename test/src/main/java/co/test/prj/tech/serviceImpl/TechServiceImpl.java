package co.test.prj.tech.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.tech.service.TechMapper;
import co.test.prj.tech.service.TechService;
import co.test.prj.tech.service.TechVO;

@Repository("techDao")
public class TechServiceImpl implements TechService {

	@Autowired
	private TechMapper map;

	@Override
	public List<TechVO> techSelectList() {
		return map.techSelectList();
	}

	@Override
	public TechVO techSelect(TechVO tech) {
		return map.techSelect(tech);
	}

	@Override
	public int techInsert(TechVO tech) {
		return map.techInsert(tech);
	}

	@Override
	public int techUpdate(TechVO tech) {
		return map.techUpdate(tech);
	}

	@Override
	public int techDelete(TechVO tech) {
		return map.techDelete(tech);
	}
	
	
}
