package co.test.prj.tech.service;

import java.util.List;

public interface TechService {
	List<TechVO> techSelectList();
	TechVO techSelect(TechVO tech);
	int techInsert(TechVO tech);
	int techUpdate(TechVO tech);
	int techDelete(TechVO tech);
}
