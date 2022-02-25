package co.test.prj.star.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.star.service.StarMapper;
import co.test.prj.star.service.StarService;
import co.test.prj.star.service.StarVO;

@Repository("starDao")
public class StarServiceImpl implements StarService {

	@Autowired
	private StarMapper map;

	@Override
	public List<StarVO> starSelectList() {
		return map.starSelectList();
	}

	@Override
	public StarVO starSelect(StarVO star) {
		return map.starSelect(star);
	}

	@Override
	public int starInsert(StarVO star) {
		return map.starInsert(star);
	}
	
	
}
