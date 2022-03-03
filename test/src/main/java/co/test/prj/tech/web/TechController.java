package co.test.prj.tech.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.test.prj.certificate.service.CertService;
import co.test.prj.certificate.service.CertVO;
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
	
	@RequestMapping("/jobSelectList")
	public String techSelectList(Model model, StarVO star) {
		model.addAttribute("users", userDao.userSelectList());
		model.addAttribute("techs", techDao.techSelectList());
		
		return "job/jobMain";
	}
	
	@RequestMapping("/jobDetail")
	public String jobDetail(int user_id, Model model) {
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
		vo6.setMaster_id(user_id);
		model.addAttribute("prjList", projectDao.jobJoinList(vo6));

		return "job/jobDetail";
	}
	
	
	
}
