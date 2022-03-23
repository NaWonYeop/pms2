package co.test.prj.interest.service;

public interface InterestMapper {
	int heartInsert(InterestVO interset);
	int heartDelete(InterestVO interest);
	
	int projectHeartInsert(InterestVO vo);
	int projectHeartDelete(InterestVO vo);
}
