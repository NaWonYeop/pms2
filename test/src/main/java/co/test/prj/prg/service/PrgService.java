package co.test.prj.prg.service;

import java.util.List;

public interface PrgService {

	List<PrgVO> prgSelectList(int prj_id);

	List<PrgVO> calSelectList(int prj_id);

	List<PrgVO> toDoSelect(PrgVO prg);

	int prgInsert(PrgVO prg);

	int prgUpdate(PrgVO prg);

	int smlUpdate(PrgVO prg);

	int prgDelete(PrgVO prg);

	int selectPrgID(PrgVO prg);

	int smlCheck(PrgVO prg);

	String prgCheck(PrgVO prg);
	
	String allCheck(PrgVO prg);
}
