package co.test.prj.prg.service;

import java.util.List;

public interface PrgService {
	List<PrgVO> midCtgSelectList(); // 중분류조회

	List<PrgVO> smlCtgSelectList(int prg_clsfc); // 소분류조회

	PrgVO selectList(int prg_id); // 단건조회

	int midCtgInsert(); // 중분류 입력

	int smlCtgInsert(int prg_id); // 소분류 입력

	int ctgUpdate(int prg_id); // 수정기능

	int ctgDelete(int prg_id);	// 삭제기능

}
