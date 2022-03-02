package co.test.prj.prg.service;

import java.util.List;

public interface PrgMapper {
	// 해당 프로젝트 조회
	List<PrgVO> prgSelectNullList(PrgVO prg); // 중분류조회
	
	List<PrgVO> prgSelectList(PrgVO prg); // 소분류조회
	
	int midPrgInsert(PrgVO prg);
	
	int midPrgUpdate(PrgVO prg);
	
	int midPrgDelete(PrgVO prg);

}
