package co.test.prj.reward.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.test.prj.reward.service.RewardService;
import co.test.prj.reward.service.RewardVO;

@Controller
public class RewardComtroller {

	@Autowired
	private RewardService rewardDao;
	
	
	@RequestMapping("/rewardInsertForm")
	public String rewardInsertForm(Model model, HttpSession session, RewardVO reward) {
		session.getAttribute("sessionMId");
		session.getAttribute("sessionPId");
		
		System.out.println("session값 ~ sessionMId : "+ session.getAttribute("sessionMId") +", sessionPId : "+ session.getAttribute("sessionPId"));

		//프로젝트 목록 보여주기
		reward.setMaster_id((int)session.getAttribute("sessionMId"));
		reward.setPrj_id((int)session.getAttribute("sessionPId"));
		
		model.addAttribute("rewards", rewardDao.rewardInsertSelect(reward));
		
		return "reward/rewardInsertForm";
	}
	
	@RequestMapping("/rewardInsert")
	public String rewardInsert(Model model, RewardVO reward) {
		System.out.println("리워드 등록");
		
		/////////////////////여기부터 하면됨!!!!!!!!!!!!!
		
		return "redirect:/rewardInsertForm";
	}
	
	
}
