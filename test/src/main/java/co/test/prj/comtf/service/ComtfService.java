package co.test.prj.comtf.service;

import java.util.List;



public interface ComtfService
{
	List<ComtfVO> comtfSelectList();//쓸일없음

	ComtfVO comtfSelect(ComtfVO comtfS);

	int comtfInsert(ComtfVO comtfS);

	int comtfUpdate(ComtfVO comtfS);

	int comtfDelete(ComtfVO comtfS);
	
	int comtfCountMax(int ctf_id);
}
