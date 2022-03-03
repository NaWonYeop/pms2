package co.test.prj.tech.service;

import java.util.List;

public interface TechMapper {
	List<TechVO> techSelectList();
	List<TechVO> techSelect(TechVO tech);
	int techInsert(TechVO tech);
	int techUpdate(TechVO tech);
	int techDelete(TechVO tech);
}
