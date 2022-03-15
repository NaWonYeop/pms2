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
import co.test.prj.team.service.MyPrjVO;
import co.test.prj.user.service.UserVO;

@Controller
public class AppController {

	@Autowired
	private AppService appDao;

	@RequestMapping("/application")
	public String application() {
		return "pms/app/app";
	}


	@RequestMapping("/appSelect")
	@ResponseBody
	public String appSelect(HttpSession session, Model modelm, HttpServletRequest request) {
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		AppVO app = new AppVO();
		
		app.setPrj_id(myPrj.getPrj_id());
		app.setMaster_id(myPrj.getMaster_id());
		
		List<AppVO> list = appDao.appSelect(app);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/appInsert")
	public void appInsert(HttpSession session, Model modelm, HttpServletRequest request) {
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		AppVO app = new AppVO();
		
		
		int prj_id = myPrj.getPrj_id();
		int master_id = myPrj.getMaster_id();
		
		int app_clsfc = 0;
		if(request.getParameter("app_clsfc") != null) {
			app_clsfc = Integer.parseInt(request.getParameter("app_clsfc"));
		} 
		
		
		app.setPrj_id(prj_id);
		app.setMaster_id(master_id);
		app.setUser_id(sessionUser.getUser_id());
		app.setApp_clsfc(app_clsfc);
		app.setUser_name(sessionUser.getUser_name());
		
		appDao.appInsert(app);
	}
	
	@RequestMapping("/appUpdate")
	public String appUpdate(HttpSession session, AppVO app, Model model) {
		UserVO sessionUser = (UserVO) session.getAttribute("sessionUser");
		
		int user_id = sessionUser.getUser_id();
		System.out.println("user_id: " + user_id);
		System.out.println("master_id: " + app.getMaster_id());
		if(user_id == app.getMaster_id()) {
			//유저와 마스터가 동일한 사람인경우 수정가능
			appDao.appUpdate(app);
		} else {
			model.addAttribute("result", "fail");
		}

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
