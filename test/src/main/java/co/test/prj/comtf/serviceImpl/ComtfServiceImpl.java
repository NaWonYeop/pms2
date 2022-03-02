package co.test.prj.comtf.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.comtf.service.ComtfMapper;
import co.test.prj.comtf.service.ComtfService;
import co.test.prj.comtf.service.ComtfVO;

@Repository("comtfDao")
public class ComtfServiceImpl implements ComtfService
{
	@Autowired
	private ComtfMapper map;
	
	//쓸일없음
	@Override
	public List<ComtfVO> comtfSelectList()
	{
		// TODO Auto-generated method stub
		return map.comtfSelectList();
	}

	@Override
	public ComtfVO comtfSelect(ComtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfSelect(comtfS);
	}

	@Override
	public int comtfInsert(ComtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfInsert(comtfS);
	}

	@Override
	public int comtfUpdate(ComtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfUpdate(comtfS);
	}

	@Override
	public int comtfDelete(ComtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfDelete(comtfS);
	}

	@Override
	public int comtfCountMax() {
		// TODO Auto-generated method stub
		return map.comtfCountMax();
	}
	
	
}
