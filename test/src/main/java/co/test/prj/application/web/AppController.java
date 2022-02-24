package co.test.prj.application.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
		Gson gson = new GsonBuilder().create();
		gson.toJson(list);
		JsonObject obj = new JsonObject();
		
		return gson.toJson(list);
	}
}
