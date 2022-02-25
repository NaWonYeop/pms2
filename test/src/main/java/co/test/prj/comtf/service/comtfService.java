package co.test.prj.comtf.service;

import java.util.List;



public interface comtfService
{
	List<comtfVO> comtfSelectList();

	comtfVO comtfSelect(comtfVO comtfS);

	int comtfInsert(comtfVO comtfS);

	int comtfUpdate(comtfVO comtfS);

	int comtfDelete(comtfVO comtfS);
}
