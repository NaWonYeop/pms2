package co.test.prj.reward.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.reward.service.RewardMapper;
import co.test.prj.reward.service.RewardService;
import co.test.prj.reward.service.RewardVO;

@Repository("rewardDao")
public class RewardServiceImpl implements RewardService {

	@Autowired
	private RewardMapper map;
	
	@Override
	public List<RewardVO> rewardSelectList() {
		return map.rewardSelectList();
	}

	@Override
	public RewardVO rewardSelect(RewardVO reward) {
		return map.rewardSelect(reward);
	}

	@Override
	public int rewardInsert(RewardVO reward) {
		return map.rewardInsert(reward);
	}

	@Override
	public int rewardUpdate(RewardVO reward) {
		return map.rewardUpdate(reward);
	}

	@Override
	public int rewardDelete(RewardVO reward) {
		return map.rewardDelete(reward);
	}

	@Override
	public List<RewardVO> rewardInsertSelect(RewardVO reward) {
		return map.rewardInsertSelect(reward);
	}

}
