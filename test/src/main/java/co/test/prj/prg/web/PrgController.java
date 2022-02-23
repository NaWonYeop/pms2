package co.test.prj.prg.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.test.prj.prg.service.PrgService;

@Controller
public class PrgController {
	@Autowired
	private PrgService service;
	
	@RequestMapping("/midCtgSelect")
	public String midCtgSelectList(HttpSession session, Model model) {
		
		
		return "member/memberLoginForm";
	}
}


