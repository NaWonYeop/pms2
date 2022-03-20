package co.test.prj.buy.service;

import java.util.List;

public interface BuyMapper {
	
	List<BuyVO> buySelectList();

	int buyInsert(BuyVO buy);
	
	int buyMaxId();
}
