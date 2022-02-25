package co.test.prj.interest.service;

import java.util.List;

public interface InterestService {
	List<InterestVO> interestSelectList();
	InterestVO interestSelect(InterestVO inter);
	int interestInsert(InterestVO inter);
	int interestDelete(InterestVO inter);
}
