package co.test.prj.interest.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.interest.service.InterestMapper;
import co.test.prj.interest.service.InterestVO;

@Repository("interDao")
public class InterestServiceImpl implements InterestMapper {
	
	@Autowired
	private InterestMapper map;

	@Override
	public int heartInsert(InterestVO interset) {
		return map.heartInsert(interset);
	}

	@Override
	public int heartDelete(InterestVO interest) {
		return map.heartDelete(interest);
	}

	@Override
	public int projectHeartInsert(InterestVO vo)
	{
		// TODO Auto-generated method stub
		return map.projectHeartInsert(vo);
	}

	@Override
	public int projectHeartDelete(InterestVO vo)
	{
		// TODO Auto-generated method stub
		return map.projectHeartDelete(vo);
	}
	
	
	
}
