package co.test.prj.comtf.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.comtf.service.comtfMapper;
import co.test.prj.comtf.service.comtfService;
import co.test.prj.comtf.service.comtfVO;

@Repository("comtfDao")
public class comtfServiceImpl implements comtfService
{
	@Autowired
	private comtfMapper map;
	
	//쓸일없음
	@Override
	public List<comtfVO> comtfSelectList()
	{
		// TODO Auto-generated method stub
		return map.comtfSelectList();
	}

	@Override
	public comtfVO comtfSelect(comtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfSelect(comtfS);
	}

	@Override
	public int comtfInsert(comtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfInsert(comtfS);
	}

	@Override
	public int comtfUpdate(comtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfUpdate(comtfS);
	}

	@Override
	public int comtfDelete(comtfVO comtfS)
	{
		// TODO Auto-generated method stub
		return map.comtfDelete(comtfS);
	}
	
	
}
