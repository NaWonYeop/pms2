package co.test.prj.star.service;

import java.util.List;

public interface StarService {
	List<StarVO> starSelectList();
	StarVO starSelect(StarVO star);
	int starInsert(StarVO star);
	List<StarVO> starAllAvg(StarVO star);
}
