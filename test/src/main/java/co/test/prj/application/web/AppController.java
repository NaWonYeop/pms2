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

@Controller
public class AppController {

	@Autowired
	private AppService appDao;
	
	@RequestMapping("/appSelectList")
	@ResponseBody
	public String appSelectList(HttpSession session, Model model) {
//		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
//		if (loginUser != null) {
//			
//		}
		List<AppVO> list = appDao.appSelectList();
		System.out.println(list);
		String gson = new Gson().toJson(list);
		
		return gson;
	}
	
	@RequestMapping("/appSelect")
	public String appSelect(HttpSession session, Model modelm, HttpServletRequest request) {
		AppVO app = new AppVO();
		app.setApp_id(Integer.parseInt(request.getParameter("app_id")));
		appDao.appSelect(app);
		return "";
	}
}
