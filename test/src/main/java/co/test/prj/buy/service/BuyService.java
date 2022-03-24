package co.test.prj.buy.service;

import java.util.List;

public interface BuyService {
	
	List<BuyVO> buySelectList();
	
	int buyInsert(BuyVO buy);
	
	int buyMaxId();
	
	int buyMaxCoinCount(BuyVO buy);
	
	int buyRFund(BuyVO buy);
	
	List<BuyVO> buyDataList(int prj_id);
	int buySumWon(int prj_id);
	long buySumWei(int prj_id);
	int buySttChange(BuyVO buy);
	List<BuyVO> buyMuidList(int prj_id);
	int buyGoSttChange(String buy_muid);
}
