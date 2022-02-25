package co.test.prj.application.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.test.prj.application.service.AppService;
import co.test.prj.application.service.AppVO;
import co.test.prj.user.service.UserVO;

@Controller
public class AppController {

	@Autowired
	private AppService appDao;

	@RequestMapping("/application")
	public String application() {
		return "pms/app/app";
	}

	@RequestMapping("/appSelectList")
	@ResponseBody
	public String appSelectList(HttpSession session, Model model) {
		List<AppVO> list = appDao.appSelectList();
		Gson gsno = new Gson();
		System.out.println(gsno.toJson(list));
		return new Gson().toJson(list);
	}

	@RequestMapping("/appSelect")
	public String appSelect(HttpSession session, Model modelm, HttpServletRequest request) {
		AppVO app = new AppVO();
		app.setApp_id(Integer.parseInt(request.getParameter("app_id")));
		appDao.appSelect(app);
		return "";
	}
	
	@RequestMapping("/appInsert")
	public String appInsert(HttpSession session, Model modelm, HttpServletRequest request) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		AppVO app = new AppVO();
		
		int app_id = Integer.parseInt(request.getParameter("app_id"));
		int prj_id = Integer.parseInt(request.getParameter("prj_id"));
		int master_id = Integer.parseInt(request.getParameter("master_id"));
		int user_id = loginUser.getUser_id();
		int app_clsfc = Integer.parseInt(request.getParameter("app_clsfc"));
		
		String app_stt = request.getParameter("app_stt");
		String user_name = request.getParameter("user_name");
		
		app.setApp_id(app_id);
		app.setPrj_id(prj_id);
		app.setMaster_id(master_id);
		app.setUser_id(user_id);
		app.setApp_clsfc(app_clsfc);
		
		app.setApp_stt(app_stt);
		app.setUser_name(user_name);
		
		appDao.appInsert(app);
		return "";
	}
	
	@RequestMapping("/appUpdate")
	public String appUpdate(HttpSession session, HttpServletRequest request) {
		// 수정은 마스터만 가능
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		System.out.println(request.getParameter("app_id"));
		System.out.println(request.getParameter("master_id"));
		System.out.println(request.getParameter("app_clsfc"));
		System.out.println(request.getParameter("app_stt"));
		
		AppVO app = new AppVO();
		
		int app_id = Integer.parseInt(request.getParameter("app_id"));
		int master_id = Integer.parseInt(request.getParameter("master_id"));
		String app_stt = request.getParameter("app_stt");
		
		
		
		app.setApp_id(app_id);
		app.setMaster_id(master_id);
		app.setApp_stt(app_stt);
		
		appDao.appUpdate(app);
		
//		if(loginUser.getUser_id() == master_id) {
//			
//		}
		
		return "pms/app/app";
	}
	
	// 사용안함
	@RequestMapping("/appDelete")
	public String appDelete(HttpSession session, HttpServletRequest request) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		int app_id = Integer.parseInt(request.getParameter("app_id"));
		
		AppVO app = new AppVO();
		
		appDao.appDelete(app);
		
		return "";
	}
}
