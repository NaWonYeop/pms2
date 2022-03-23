package co.test.prj.buy.service;

import java.util.List;

public interface BuyService {
	
	List<BuyVO> buySelectList();
	
	int buyInsert(BuyVO buy);
	
	int buyMaxId();
	
	int buyMaxCoinCount(int user_id);
	
	int buyRFund(BuyVO buy);
	
	List<BuyVO> buyDataList(int prj_id);
	int buySumWon(int prj_id);
	long buySumWei(int prj_id);
	int buySttChange(BuyVO buy);
}
