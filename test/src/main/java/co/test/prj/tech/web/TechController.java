package co.test.prj.tech.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.test.prj.tech.service.TechService;
import co.test.prj.user.service.UserService;

@Controller
public class TechController {

	@Autowired
	private TechService techDao;
	
	@Autowired
	private UserService userDao;
	
	@RequestMapping("/techSelectList")
	@ResponseBody
	public String techSelectList(Model model) {
		model.addAttribute("users", userDao.userSelectList());
		model.addAttribute("techs", techDao.techSelectList());
		return "job/jobMain";
	}
	
}
