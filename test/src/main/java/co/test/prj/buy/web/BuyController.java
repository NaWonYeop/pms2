package co.test.prj.buy.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.test.prj.buy.service.BuyService;
import co.test.prj.buy.service.BuyVO;
import co.test.prj.reward.service.RewardService;
import co.test.prj.reward.service.RewardVO;
import co.test.prj.user.service.UserVO;

@Controller
public class BuyController {
	
	@Autowired
	private BuyService buyDao;
	
	@Autowired
	private RewardService rewardDao;
	
	@PostMapping("/ajaxBuy")
	@ResponseBody
	private int ajaxBuy(@RequestBody BuyVO buy, RewardVO reward) {
		System.out.println("결제했니?");
		System.out.println("뭐로 : " +buy.getBuy_way());
		System.out.println("웨이 얼마 : " +buy.getBuy_wei());
		System.out.println("현금 얼마 : " +buy.getBuy_won());
		buy.setBuy_id(buyDao.buyMaxId());
		buyDao.buyInsert(buy);
		System.out.println("인서트 됨?");
		
		//리워드 업데이트
		reward.setReward_id(buy.getReward_id());
		int count = rewardDao.rewardMaxCot(reward);
		int rCot = count + buy.getBuy_count();
		System.out.println("총 수량 : " + rCot);
		
		reward.setRwd_cot(rCot);
		int result = rewardDao.rewardCotUpdate(reward);
		System.out.println("리워드 업데이트");
		
		return result;
	}
	
	@PostMapping("/ajaxRFnd")
	@ResponseBody
	private int ajaxRFnd(@RequestBody BuyVO buy, RewardVO reward) {
		System.out.println("환불했니?");
		System.out.println("buy_id : "+ buy.getBuy_id());
		System.out.println("reward_id : "+ buy.getReward_id());
		
		//buy 수정
		buyDao.buyRFund(buy);
		
		//reward 수정
		System.out.println("buy_count : "+ buy.getBuy_count());

		reward.setReward_id(buy.getReward_id());
		reward.setRwd_cot(buy.getBuy_count());
		System.out.println("리워드 수정?");
		int result = rewardDao.rewardRFund(reward);
		
		return result;
	}
	
	
//	//사용용도 변경예정
//	@RequestMapping("/ajaxCoin")
//	@ResponseBody
//	public double ajaxCoin(@RequestParam("won") int won) {
//		System.out.println("오니?");
//
//		System.out.println("이더리움 시세 가져오기 시작");
//		String etherURL = "https://kr.investing.com/crypto/ethereum/eth-krw-converter";
//		String select = "#last_last";
//		Document doc = null;
//		
//		try {
//			System.out.println("접속?");
//			doc = Jsoup.connect(etherURL).get();
//			System.out.println("됨?");
//			
//		} catch (IOException e) {
//			System.out.println("접속?????");
//			e.printStackTrace();
//		}
//		
//		Elements etherGO = doc.select(select);
//		System.out.println(etherGO.text());
//		//이더리움 
//		double ether = Double.parseDouble(etherGO.text().replace(",", ""));
//		
////		System.out.println("1달러 원가격 : " + cashWD);
////		System.out.println("1 이더 달러가격 : " + ether );
//		System.out.println("1 이더 원화가격 : " + ether );
//		
//		//int totalWon = (int) Math.round(ether* cashWD);
////		double totalWon = ether* cashWD;
//		
//		
////		System.out.println("1이더 현금가격 : "+ totalWon);
//		System.out.println("현금가격 : "+ won);
//		
//		System.out.println(won/ether);
//		
//		return won/ether;
//		
//		
//	}
	
	@RequestMapping("/ajaxSise")
	@ResponseBody
	private Map<String, Object> ajaxSise(HttpSession session,@RequestParam("user_id") int user_id,@RequestParam("master_id") int master_id, BuyVO buy ){
		System.out.println("시세시작");
		Map<String, Object> map = new HashedMap();
		
		// 파싱한 데이터를 저장할 변수
    	String result = "";
    	double cashWD = 0;
		try {
			//환율 가져오기
			URL url = new URL("https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.KRWUSD");
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

    		result = bf.readLine();
        	JSONParser jsonParser = new JSONParser();
        	JSONArray jsonarray = (JSONArray)jsonParser.parse(result);
        	JSONObject jsonObject = (JSONObject)jsonarray.get(0);
        	cashWD = (double)jsonObject.get("cashBuyingPrice");
        	//cashWD = (double)jsonObject.get("basePrice");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("환율 가져오기 실패");
		}
		
		
		System.out.println("이더리움 달러 가져오기 시작");
		String etherDURL = "https://kr.investing.com/crypto/ethereum";
		String selectD = "#last_last";
		Document docD = null;
		
		try {
			System.out.println("접속?");
			docD = Jsoup.connect(etherDURL).get();
			System.out.println("됨?");
			
		} catch (IOException e) {
			System.out.println("접속?????");
			e.printStackTrace();
		}
		
		Elements etherDGO = docD.select(selectD);
		System.out.println(etherDGO.text());
		//이더리움 
		double etherD = Double.parseDouble(etherDGO.text().replace(",", ""));
		
		
//		//int totalWon = (int) Math.round(ether* cashWD);
//		double totalWon = ether* cashWD;
		
		
		System.out.println("이더리움 원화 시세 가져오기 시작");
		String etherWURL = "https://kr.investing.com/crypto/ethereum/eth-krw-converter";
		String selectW = "#last_last";
		Document docW = null;
		
		try {
			System.out.println("접속?");
			docW = Jsoup.connect(etherWURL).get();
			System.out.println("됨?");
			
		} catch (IOException e) {
			System.out.println("접속?????");
			e.printStackTrace();
		}
		
		Elements etherGO = docW.select(selectW);
		System.out.println(etherGO.text());
		//이더리움 
		double etherW = Double.parseDouble(etherGO.text().replace(",", ""));
		
		
		System.out.println("1달러 원가격 : " + cashWD);
		System.out.println("1 이더 달러가격 : " + etherD );
		System.out.println("1 이더 원화가격 : " + etherW );
		
		
		map.put("dol", cashWD);
		map.put("etherDol", etherD);
		map.put("etherWon", etherW);
		
		//UserVO vo =(UserVO)session.getAttribute("sessionUser");
		//int user_id= vo.getUser_id();
		System.out.println("user_id : " + user_id);
		System.out.println("master_id : " + master_id);
		buy.setUser_id(user_id);
		buy.setMaster_id(master_id);
		map.put("buyMaxCoinCount", buyDao.buyMaxCoinCount(buy));
		return map;
	}
	
//	@RequestMapping("/buySelectList")
//	public String buySelectList(Model model) {
//		model.addAttribute("buys", buyDao.buySelectList());
//		return "buy/buySelectList";
//	}
	
	 @RequestMapping("/ajaxBuyData")
	 @ResponseBody
	 private Map<String, Object> ajaxBuyData( @RequestParam("prj_id") int pId){
		System.out.println("ajaxBuyData시작");
		System.out.println("prj_id : " + pId);

		Map<String, Object> map = new HashedMap();
		
		
		map.put("buys", buyDao.buyDataList(pId));
		map.put("sumWon", buyDao.buySumWon(pId));
		map.put("sumWei", buyDao.buySumWei(pId));
		map.put("muids", buyDao.buyMuidList(pId));

		
		return map;
	 }
	 
	 
	 @PostMapping("/ajaxMuidUpDate")
	 @ResponseBody
	 private int ajaxMuidUpDate(@RequestParam("buy_muid") String buy_muid){
		 System.out.println("구매코드 : " + buy_muid);
		 
		 int result = buyDao.buyGoSttChange(buy_muid);
	 
	 
		 return result;
     }
 

}
