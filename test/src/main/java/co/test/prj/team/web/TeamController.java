package co.test.prj.team.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.test.prj.prg.service.PrgService;
import co.test.prj.prg.service.PrgVO;
import co.test.prj.team.service.MyPrjVO;
import co.test.prj.team.service.TeamService;
import co.test.prj.team.service.TeamVO;
import co.test.prj.user.service.UserVO;

@Controller
public class TeamController {

	@Autowired
	private TeamService teamDao;

	@Autowired
	private PrgService prgDao;

	@RequestMapping("/msteam")
	public String team(HttpSession session) {
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");
		MyPrjVO prj = (MyPrjVO) session.getAttribute("myPrj");

		return "pms/team/team";
	}

	@RequestMapping("/myPrj")
	@ResponseBody
	public Map<String, Object> myTeam(HttpSession session, HttpServletRequest request, PrgVO prg, MyPrjVO myPrj) {
		System.out.println("prj_id: " + myPrj.getPrj_id());
		System.out.println("master_id: " + myPrj.getMaster_id());
		System.out.println("prj_name: " + myPrj.getPrj_name());
		
		Map<String, Object> map = new HashMap<>();
		session.setAttribute("myPrj", myPrj);
		String percent = prgDao.allCheck(prg);
		if (percent == null) {
			percent = "0";
		}
		map.put("percent", percent);
		map.put("prj_name", myPrj.getPrj_name());
		return map;
	}

	@RequestMapping("/myProjectList")
	@ResponseBody
	public String myProjectList(HttpSession session, Model model) {
		// 프로젝트 번호, 마스터 번호로 프로젝트를 찾고 리스트 출력
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");
		TeamVO team = new TeamVO();
		team.setUser_id(sessionUser.getUser_id());
		List<TeamVO> list = teamDao.myProjectList(team);
		return new Gson().toJson(list);
	}

	//
	@RequestMapping("/teamSelect")
	@ResponseBody
	public String teamSelect(HttpSession session, Model model) {
		// 프로젝트 번호, 마스터 번호로 프로젝트를 찾고 리스트 출력
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		TeamVO team = new TeamVO();
		team.setPrj_id(myPrj.getPrj_id());

		List<TeamVO> list = teamDao.teamSelect(team);
		
		
		return new Gson().toJson(list);
	}

	@RequestMapping("/teamInsert")
	@ResponseBody
	public String teamInsert(HttpSession session, TeamVO team) {
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");
		int user_id = sessionUser.getUser_id();
		// 유저번호, 프로젝트번호, (포지션, 급여, 부서), 마스터번호
		System.out.println(team.getUser_id());
		System.out.println(team.getPrj_id());
		System.out.println(team.getMaster_id());
		teamDao.teamInsert(team);
		if (user_id == team.getMaster_id()) {
		}
		return "성공";
	}

	@RequestMapping("/teamUpdate")
	@ResponseBody
	public String teamUpdate(HttpSession session, TeamVO team) {
		teamDao.teamUpdate(team);
		return "";
	}

	@RequestMapping("/teamDelete")
	public String teamDelete(HttpSession session, Model model, HttpServletRequest req) {

		return "";
	}
}
