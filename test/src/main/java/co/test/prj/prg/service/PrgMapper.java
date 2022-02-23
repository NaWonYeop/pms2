package co.test.prj.prg.service;

import java.util.List;

public interface PrgMapper {
	List<PrgVO> midCtgSelectList(); // 중분류조회

	List<PrgVO> smlCtgSelectList(PrgVO prg); // 소분류조회

	PrgVO selectList(PrgVO prg); // 단건조회

	int midCtgInsert(); // 중분류 입력

	int smlCtgInsert(PrgVO prg); // 소분류 입력

	int ctgUpdate(PrgVO prg); // 수정기능

	int ctgDelete(PrgVO prg);	// 삭제기능
}
