package co.test.prj.buy.service;

import java.util.List;

public interface BuyService {
	
	List<BuyVO> buySelectList();
	
	int buyInsert(BuyVO buy);
	
	int buyMaxId();
}
