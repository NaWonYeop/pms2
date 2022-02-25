package co.test.prj.interest.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.interest.service.InterestMapper;
import co.test.prj.interest.service.InterestVO;

@Repository
public class InterestServiceImpl implements InterestMapper {
	
	@Autowired
	private InterestMapper map;

	@Override
	public List<InterestVO> interestSelectList() {
		return map.interestSelectList();
	}

	@Override
	public InterestVO interestSelect(InterestVO inter) {
		return map.interestSelect(inter);
	}

	@Override
	public int interestInsert(InterestVO inter) {
		return map.interestInsert(inter);
	}

	@Override
	public int interestDelete(InterestVO inter) {
		return map.interestDelete(inter);
	}
	
	
}
