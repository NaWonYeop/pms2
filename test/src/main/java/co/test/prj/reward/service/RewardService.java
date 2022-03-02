package co.test.prj.reward.service;

import java.util.List;

public interface RewardService {
	List<RewardVO> rewardSelectList();
	RewardVO rewardSelect(RewardVO reward);
	int rewardInsert(RewardVO reward);
	int rewardUpdate(RewardVO reward);
	int rewardDelete(RewardVO reward);
	
	List<RewardVO> rewardInsertSelect(RewardVO reward);

}
