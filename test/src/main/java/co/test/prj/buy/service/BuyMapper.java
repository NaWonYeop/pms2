package co.test.prj.buy.service;

import java.util.List;

public interface BuyMapper {
	
	List<BuyVO> buySelectList();

	int buyInsert(BuyVO buy);
	
	int buyMaxId();
	
	int buyMaxCoinCount(int user_id);
	
	//리워드 환불
	int buyRFund(BuyVO buy);
}
