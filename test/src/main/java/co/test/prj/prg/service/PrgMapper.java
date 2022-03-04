package co.test.prj.prg.service;

import java.util.List;

public interface PrgMapper {
	
	List<PrgVO> prgSelectList(int prj_id);
	
	int prgInsert(PrgVO prg);
	
	int prgUpdate(PrgVO prg);
	
	int smlUpdate(PrgVO prg);
	
	int prgDelete(PrgVO prg);
}
