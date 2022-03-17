package co.test.prj.team.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.test.prj.team.service.MyPrjVO;
import co.test.prj.team.service.TeamService;
import co.test.prj.team.service.TeamVO;
import co.test.prj.user.service.UserVO;

@Controller
public class TeamController {

	@Autowired
	private TeamService teamDao;

	@RequestMapping("/msteam")
	public String team(HttpSession session) {
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");
		MyPrjVO prj = (MyPrjVO) session.getAttribute("myPrj");
		
		
		
		return "pms/team/team";
	}

	@RequestMapping("/myPrj")
	@ResponseBody
	public void myTeam(HttpSession session, HttpServletRequest request) {
		MyPrjVO prj = new MyPrjVO();
		
		prj.setPrj_id(Integer.parseInt(request.getParameter("prj_id")));
		prj.setMaster_id(Integer.parseInt(request.getParameter("master_id")));
		System.out.println("prj_id: " + prj.getPrj_id());
		System.out.println("master_id: " + prj.getMaster_id());
		// 기존에 담겨있던 내 프로젝트 번호 삭제
		if(session.getAttribute("myPrj") != null ) {
			session.removeAttribute("myPrj");
		}
		session.setAttribute("myPrj", prj);
		
		// 새롭게 받아온 프로젝트번호 삽입
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
		if(user_id == team.getMaster_id()) {
		}
		return "성공";
	}

	@RequestMapping("/teamUpdate")
	public String teamUpdate(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		return "";
	}

	@RequestMapping("/teamDelete")
	public String teamDelete(HttpSession session, Model model, HttpServletRequest req) {

		return "";
	}
}
