package co.test.prj.buy.service;

import java.util.List;

public interface BuyMapper {
	
	List<BuyVO> buySelectList();

	int buyInsert(BuyVO buy);
	
	int buyMaxId();
	
	int buyMaxCoinCount(BuyVO buy);
	
	//리워드 환불
	int buyRFund(BuyVO buy);
	
	//정산용
	List<BuyVO> buyDataList(int prj_id);
	int buySumWon(int prj_id);
	long buySumWei(int prj_id);
	int buySttChange(BuyVO buy);
	List<BuyVO> buyMuidList(int prj_id);
	
}
