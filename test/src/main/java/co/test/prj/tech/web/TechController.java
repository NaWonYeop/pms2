package co.test.prj.tech.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.test.prj.application.service.AppService;
import co.test.prj.application.service.AppVO;
import co.test.prj.certificate.service.CertService;
import co.test.prj.certificate.service.CertVO;
import co.test.prj.interest.service.InterestService;
import co.test.prj.interest.service.InterestVO;
import co.test.prj.project.service.ProjectService;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.star.service.StarService;
import co.test.prj.star.service.StarVO;
import co.test.prj.team.service.TeamService;
import co.test.prj.team.service.TeamVO;
import co.test.prj.tech.service.TechService;
import co.test.prj.tech.service.TechVO;
import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;

@Controller
public class TechController {

	@Autowired
	private TechService techDao;
	
	@Autowired
	private UserService userDao;
	
	@Autowired
	private CertService certDao;
	
	@Autowired
	private TeamService teamDao;
	
	@Autowired
	private StarService starDao;
	
	@Autowired
	private ProjectService projectDao;
	
	@Autowired
	private AppService appDao;
	
	@Autowired
	private InterestService interDao;
	
	@RequestMapping("/jobSelectList")
	public String techSelectList(Model model, StarVO star,HttpSession session) {
		UserVO uId = (UserVO)session.getAttribute("sessionUser");
		if(uId!=null)
		{
			model.addAttribute("inters",techDao.jobInterList(uId.getUser_id()));
		}
		model.addAttribute("jobs", techDao.jobSelectList());
		model.addAttribute("techs", techDao.techSelectList());
		
		return "job/jobMain";
	}
	
	@RequestMapping("/jobDetail")
	public String jobDetail(int user_id, Model model, HttpSession session) {
		UserVO vo = new UserVO();
		vo.setUser_id(user_id);
		model.addAttribute("jobDetail", userDao.jobSelect(vo));
		
		CertVO vo2 = new CertVO();
		vo2.setUser_id(user_id);
		model.addAttribute("certDetail", certDao.certSelect(vo2));
		
		TechVO vo3 = new TechVO();
		vo3.setUser_id2(user_id);
		model.addAttribute("techDetail", techDao.techSelect(vo3));
		
		TeamVO vo4 = new TeamVO();
		vo4.setUser_id(user_id);
		model.addAttribute("prjDetail", teamDao.jobDetailSelect(vo4));
		
		StarVO vo5 = new StarVO();
		vo5.setUser_id(user_id);
		model.addAttribute("starDetail", starDao.starSelect(vo5));
		
		ProjectVO vo6 = new ProjectVO();
		UserVO uId = (UserVO)session.getAttribute("sessionUser");


		if(uId!=null) {
			vo6.setMaster_id(uId.getUser_id()); 
			model.addAttribute("prjList", techDao.jobJoinList(vo6));
			
			InterestVO vo7 = new InterestVO();
			vo7.setUser_id(uId.getUser_id()); //세션아이디
			vo7.setUser_id2(user_id);
			vo7=techDao.heartbtnCheck(vo7);
			if(vo7 != null)	{
				model.addAttribute("heartCheck", vo7.getUser_id());
			} else {
				model.addAttribute("heartCheck", "no");
			}
		
		}

		return "job/jobDetail";
		
	}
	@RequestMapping("/heartCancel")
	@ResponseBody
	public void heartCancel(InterestVO inter) {
		interDao.heartDelete(inter);
	}
	
	@RequestMapping("/jobInsertMove")
	public String jobInsertMove() {
		return "job/jobInsert";
	}
	
	@RequestMapping("/jobInsert")
	public String jobInsert(Model model, UserVO user, HttpSession session) {
		UserVO userId = (UserVO)session.getAttribute("sessionUser");
		user.setUser_id(userId.getUser_id());
		model.addAttribute(userDao.userUpdate(user));
		return "redirect:/jobSelectList";
	}
	
	//구인 신청하기
	@RequestMapping("/requestWork")
	@ResponseBody
	public void requestWork(HttpSession session, AppVO app) {
		UserVO userId = (UserVO)session.getAttribute("sessionUser");
		app.setMaster_id(userId.getUser_id());
		app.setApp_clsfc(0);
		app.setApp_stt("ing");
		appDao.appInsert(app);
	}
	
	//찜하기
	@RequestMapping("/heartInsert")
	@ResponseBody
	public void heartInsert(InterestVO inter) {
		interDao.heartInsert(inter);
	}
	
	//구인현황
	@RequestMapping("/projectOfrList")
	private String projectOfrList(Model model, ProjectVO project, TechVO tech, HttpSession session) {
		
		model.addAttribute("memberList", techDao.memberList(project));
		
		UserVO user= (UserVO)session.getAttribute("sessionUser");
		project.setMaster_id(user.getUser_id());
		model.addAttribute("ofterList", techDao.ofterList(project));
		
		model.addAttribute("prj_id",project.getPrj_id());
		
		tech.setUser_id(user.getUser_id());
		model.addAttribute("interest", techDao.interestList(tech));
		
		return "project/projectOfrList";
	}
	
	//신청수락
	@RequestMapping("/projectOfrAccept")
	private String projectOfrAccept(Model model, HttpSession session,TeamVO vo, AppVO appvo) {
		
		techDao.ofterAcceptInsert(vo);
		
		appvo.setApp_stt("ok");
		techDao.ofterAcceptUpdate(appvo);
		return "redirect:/projectOfrList";
	}
	
	//신청거절
	@RequestMapping("/projectOfrDecline")
	@ResponseBody
	private String projectOfrDecline(Model model, AppVO appvo) {
		techDao.ofterAcceptUpdate(appvo);
		return "redirect:/projectOfrList";
	}
	
	//관심 신청
	@RequestMapping("/heartAccept")
	@ResponseBody
	private void heartAccept(Model model, AppVO app, HttpSession session) {
		UserVO uId = (UserVO)session.getAttribute("sessionUser");
		app.setMaster_id(uId.getUser_id());
		model.addAttribute(techDao.heartAccept(app));
	}
	//관심삭제
	@RequestMapping("/heartDelete")
	@ResponseBody
	private void heartDelete(InterestVO interest) {
		techDao.heartDelete(interest);
	}
	
	//평가페이지
	@RequestMapping("/projectAssessList")
	private String projectAssess(Model model, ProjectVO project) {
		
		model.addAttribute("AssessList", techDao.AssessList(project));
		return "project/projectAssess";
	}
	
	//평가 Insert
	@RequestMapping("/projectAssess")
	@ResponseBody
	private void projectAssess(StarVO star, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("sessionUser");
		star.setUser_id2(user.getUser_id());
		techDao.AssessInsert(star);
		
	}
	
	//평가 Update
	@RequestMapping("/projectAssessUpdate")
	@ResponseBody
	private void projectAssessUpdate(StarVO star, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("sessionUser");
		star.setUser_id2(user.getUser_id());
		techDao.AssessUpdate(star);
		
	}
	
	
}
