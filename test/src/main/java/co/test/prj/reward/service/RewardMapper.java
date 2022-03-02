package co.test.prj.reward.service;

import java.util.List;

public interface RewardMapper {
	List<RewardVO> rewardSelectList();
	RewardVO rewardSelect(RewardVO reward);
	int rewardInsert(RewardVO reward);
	int rewardUpdate(RewardVO reward);
	int rewardDelete(RewardVO reward);
	
	//프로젝트별 리워드 목록
	List<RewardVO> rewardInsertSelect(RewardVO reward);

}
