package co.test.prj.buy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.buy.service.BuyMapper;
import co.test.prj.buy.service.BuyService;
import co.test.prj.buy.service.BuyVO;

@Repository("buyDao")
public class BuyServiceImpl implements BuyService {
	@Autowired
	private BuyMapper map;
	
	@Override
	public List<BuyVO> buySelectList() {
		return map.buySelectList();
	}
	
	@Override
	public int buyInsert(BuyVO buy) {
		return map.buyInsert(buy);
	}

	@Override
	public int buyMaxId() {
		return map.buyMaxId();
	}

	@Override
	public int buyMaxCoinCount(BuyVO buy) {
		return map.buyMaxCoinCount(buy);
	}


	@Override
	public int buyRFund(BuyVO buy) {
		return map.buyRFund(buy);
	}

	@Override
	public List<BuyVO> buyDataList(int prj_id) {
		return map.buyDataList(prj_id);
	}

	@Override
	public int buySumWon(int prj_id) {
		return map.buySumWon(prj_id);
	}
	
	@Override
	public long buySumWei(int prj_id) {
		return map.buySumWei(prj_id);
	}
	
	@Override
	public int buySttChange(BuyVO buy) {
		return map.buySttChange(buy);
	}

	@Override
	public List<BuyVO> buyMuidList(int prj_id) {
		return map.buyMuidList(prj_id);
	}


	@Override
	public int buyGoSttChange(String buy_muid) {
		return map.buyGoSttChange(buy_muid);
	}


	


	


}
