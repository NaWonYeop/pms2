package co.test.prj.pms;

import java.util.List;

public interface ListService {
	List<ListVO> SelectListAll(); // 전체 리스트조회

	ListVO selectList(ListVO vo); // 단건 조회

	int listInsert(ListVO vo); // 소분류 입력

	int listUpdate(ListVO vo); // 소분류 수정

	int listDelete(ListVO vo); // 소분류 삭제

}
