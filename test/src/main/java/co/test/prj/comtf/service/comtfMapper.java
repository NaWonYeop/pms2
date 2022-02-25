package co.test.prj.comtf.service;

import java.util.List;

public interface comtfMapper
{
	List<comtfVO> comtfSelectList();//쓸일없음

	comtfVO comtfSelect(comtfVO comtfS);

	int comtfInsert(comtfVO comtfS);

	int comtfUpdate(comtfVO comtfS);

	int comtfDelete(comtfVO comtfS);
}
