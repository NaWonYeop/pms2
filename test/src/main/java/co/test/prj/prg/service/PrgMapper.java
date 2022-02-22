package co.test.prj.prg.service;

import java.util.List;

public interface PrgMapper {
	List<PrgVO> selectListAll(); // 전체 리스트조회

	PrgVO selectList(PrgVO vo); // 단건 조회

	int listInsert(PrgVO vo); // 소분류 입력

	int listUpdate(PrgVO vo); // 소분류 수정

	int listDelete(PrgVO vo); // 소분류 삭제
}
