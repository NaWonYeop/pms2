package co.test.prj.buy.serviceImpl;

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
	public int buyInsert(BuyVO buy) {
		return map.buyInsert(buy);
	}

	@Override
	public int buyMaxId() {
		return map.buyMaxId();
	}

}
