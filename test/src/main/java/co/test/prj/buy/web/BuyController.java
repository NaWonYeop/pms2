package co.test.prj.buy.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.test.prj.buy.service.BuyService;
import co.test.prj.buy.service.BuyVO;
import co.test.prj.reward.service.RewardService;
import co.test.prj.reward.service.RewardVO;

@Controller
public class BuyController {
	
	@Autowired
	private BuyService buyDao;
	
	@Autowired
	private RewardService rewardDao;
	
	@PostMapping("/ajaxCashBuy")
	@ResponseBody
	private int ajaxCashBuy(@RequestBody BuyVO buy, RewardVO reward ,BuyVO buy2) {
		System.out.println("결제했니?");
		//////////////////pId 입력 오류 모르겠음~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//		System.out.println(buy);
//		int uId = buy.getUser_id();
//		String bWay = buy.getBuy_way();
//		int rId = buy.getReward_id();
//		int bCount = buy.getBuy_count();
//		String bMuid = buy.getBuy_muid();
//		int pId = buy.getPrj_id();
//		int bId = buyDao.buyMaxId();
//		System.out.println(buy);
//		buy2.setBuy_id(bId);
//		buy2.setUser_id(uId);
//		buy2.setBuy_way(bWay);
//		buy2.setReward_id(rId);
//		buy2.setPrj_id(pId);
//		buy2.setBuy_count(bCount);
//		buy2.setBuy_muid(bMuid);
//		System.out.println(buy2);
//		
//		buyDao.buyInsert(buy2);
		buy.setBuy_id(buyDao.buyMaxId());
		buyDao.buyInsert(buy);
		System.out.println("인서트 됨?");
		
		//리워드 업데이트
		reward.setReward_id(buy.getReward_id());
		int count = rewardDao.rewardMaxCot(reward);
		int rCot = count + buy.getBuy_count();
		System.out.println("총 수량 : " + rCot);
		
		reward.setRwd_cot(rCot);
		rewardDao.rewardCotUpdate(reward);
		System.out.println("리워드 업데이트");
		
		return 1;
	}
	

	

}
