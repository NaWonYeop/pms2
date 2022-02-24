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

import co.test.prj.application.service.AppVO;
import co.test.prj.team.service.TeamService;
import co.test.prj.team.service.TeamVO;
import co.test.prj.user.service.UserVO;

@Controller
public class TeamController {

	@Autowired
	private TeamService teamDao;
	
	@RequestMapping("/team")
	public String team(HttpSession session) {
		return "pms/team/teamSelectList";
	}

	@RequestMapping("/teamSelectList")
	@ResponseBody
	public String teamSelectList(HttpSession session, Model model) {
		List<TeamVO> list = teamDao.teamSelectList();
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	
	@RequestMapping("/teamInsert")
	public String teamInsert(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		if(loginUser != null) {
			TeamVO team = new TeamVO();
			
			int user_id = loginUser.getUser_id();
			int prj_id = Integer.parseInt(request.getParameter("prj_id"));
			String tm_dept = request.getParameter("tm_dept");
			String tm_pos = request.getParameter("tm_pos");
			int tm_sal = Integer.parseInt(request.getParameter("tm_sal"));
			
			team.setUser_id(user_id);
			team.setPrj_id(prj_id);
			team.setTm_dept(tm_dept);
			team.setTm_pos(tm_pos);
			team.setTm_sal(tm_sal);
			
			teamDao.teamInsert(team);
		} else {
			return "로그인안됨";
		}
		

		return "";
	}
}
