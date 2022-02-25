package co.test.prj.interest.service;

import java.util.List;

public interface InterestMapper {
	List<InterestVO> interestSelectList();
	InterestVO interestSelect(InterestVO inter);
	int interestInsert(InterestVO inter);
	int interestDelete(InterestVO inter);
}
