package co.test.prj.reward.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.test.prj.comtf.service.ComtfService;
import co.test.prj.project.service.ProjectService;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.reward.service.RewardService;
import co.test.prj.reward.service.RewardVO;

@Controller
public class RewardComtroller {

	@Autowired
	private RewardService rewardDao;
	
	//리워드 관리 폼 
	@RequestMapping("/rewardInsertForm")
	public String rewardInsertForm(Model model, 
			HttpSession session, 
			RewardVO reward, 
			ProjectVO project, 
			@RequestParam(value ="go", required = false) String go ) {
		System.out.println("리워드 관리 페이지");
		System.out.println(go);
		if( "selectPage".equals(go) ) {
			System.out.println("상세페이지에서 들어오냐");
			//상세페이지에서 이동
			int pId = project.getPrj_id();
			int mId = project.getMaster_id();
			System.out.println("PId : "+ pId +", MId : "+ mId);
			
			session.setAttribute("sessionMId", mId);
			session.setAttribute("sessionPId", pId);
		}
		

		//프로젝트 등록시 값을 가져옴
		//나중에 프로젝트 상세페이지에 리워드보여줄때도 들고오게 할것
		
		session.getAttribute("sessionMId");
		session.getAttribute("sessionPId");
		
		System.out.println("session값 ~ sessionMId : "+ session.getAttribute("sessionMId") +", sessionPId : "+ session.getAttribute("sessionPId"));

		//리워드 목록 보여주기
		reward.setMaster_id((int)session.getAttribute("sessionMId"));
		reward.setPrj_id((int)session.getAttribute("sessionPId"));
		
		model.addAttribute("rewards", rewardDao.rewardInsertSelect(reward));
		
		return "reward/rewardInsertForm";
	}
	
	@RequestMapping("/rewardInsert")
	public String rewardInsert(RewardVO reward) {
		System.out.println("리워드 등록");
		
		rewardDao.rewardInsert(reward);
		
		return "redirect:/rewardInsertForm";
	}
	
	@RequestMapping("/rewardDelete")
	public String rewardDelete(RewardVO reward) {
		System.out.println("리워드 삭제");
		
		rewardDao.rewardDelete(reward);
		
		return "redirect:/rewardInsertForm";
	}
	
	
}
