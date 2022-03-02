package co.test.prj.prg.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.test.prj.prg.service.PrgService;
import co.test.prj.user.service.UserVO;

@Controller
public class PrgController {

	@Autowired
	private PrgService prgDao;
	
	
	@RequestMapping("/progress")
	public String pregress(HttpSession session, Model model) {
		return "pms/prg/prg";
	}

	@RequestMapping("/midCtgSelect")
	public String midCtgSelectList(HttpSession session, Model model) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		if (loginUser != null) {
			
		}

		return "member/memberLoginForm";
	}
}
