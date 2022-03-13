package co.test.prj.buy.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
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
	
	
	@RequestMapping("/ajaxCoin")
	public String ajaxCoin() {
		System.out.println("오니?");
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
        	//cashWD = (double)jsonObject.get("cashBuyingPrice");
        	cashWD = (double)jsonObject.get("basePrice");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("환율 가져오기 실패");
		}
		
		System.out.println("이더리움 시세 가져오기 시작");
		String etherURL = "https://kr.investing.com/crypto/ethereum";
		String select = "#last_last";
		Document doc = null;
		
		try {
			System.out.println("접속?");
			doc = Jsoup.connect(etherURL).get();
			System.out.println("됨?");
			
		} catch (IOException e) {
			System.out.println("접속?????");
			e.printStackTrace();
		}
		
		Elements etherGO = doc.select(select);
		System.out.println(etherGO.text());
		//이더리움 
		double ether = Double.parseDouble(etherGO.text().replace(",", ""));
		
		System.out.println("1달러 원가격 : " + cashWD);
		System.out.println(" 1 이더 달러가격 : " + ether );
		
		double totalWon = ether* cashWD;
		System.out.println("1이더 현금가격 : "+ totalWon);
		
		return null;
	}

	

}
