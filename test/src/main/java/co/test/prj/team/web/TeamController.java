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

import co.test.prj.team.service.TeamService;
import co.test.prj.team.service.TeamVO;
import co.test.prj.user.service.UserVO;

@Controller
public class TeamController {

	@Autowired
	private TeamService teamDao;

	@RequestMapping("/team")
	public String team(HttpSession session) {
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");

		if (sessionUser != null) {
			TeamVO myTeam = (TeamVO) session.getAttribute("myTeam");
		}
		return "pms/team/team";
	}

	@RequestMapping("/myPrj_id")
	@ResponseBody
	public void myTeam(HttpSession session, HttpServletRequest request) {
		int prj_id = Integer.parseInt(request.getParameter("prj_id"));
		System.out.println("prj_id: " + prj_id);
		// 기존에 담겨있던 내 프로젝트 번호 삭제
		if(session.getAttribute("myPrj_id") != null ) {
			session.removeAttribute("myPrj_id");
		} 
		session.setAttribute("myPrj_id", prj_id);		
		
		// 새롭게 받아온 프로젝트번호 삽입
	}
	
	@RequestMapping("/teamSelect")
	@ResponseBody
	public String teamSelect(HttpSession session, Model model) {
		// 로그인했을 때 자신이 소속된 팀목록을 가져와서 자신의 팀에 넣기
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");
		int user_id = sessionUser.getUser_id();
		
		TeamVO team = new TeamVO();
		
		team.setUser_id(user_id);
		System.out.println("user_id" + user_id);
		
		List<TeamVO> list = teamDao.teamSelect(team);
		return new Gson().toJson(list);
	}

	@RequestMapping("/teamSelectList")
	@ResponseBody
	public String teamSelectList(HttpSession session, Model model) {
		List<TeamVO> list = teamDao.teamSelectList();
		return new Gson().toJson(list);
	}

	@RequestMapping("/teamInsert")
	@ResponseBody
	public String teamInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		TeamVO team = new TeamVO();

		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");

		int user_id = sessionUser.getUser_id();
		int prj_id = Integer.parseInt(request.getParameter("prj_id"));

		int master_id = 0;

		team.setUser_id(user_id);
		team.setPrj_id(prj_id);
		if (user_id == master_id) {
			team.setTm_pos("master");
		} else {
			team.setTm_pos("employee");
		}

		teamDao.teamInsert(team);

		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		if (loginUser != null) {

		} else {
			return "로그인안됨";
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
