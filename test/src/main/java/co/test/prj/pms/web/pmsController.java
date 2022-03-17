package co.test.prj.pms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pmsController {

	@RequestMapping("/pms")
	public String main() {
		return "pms/home/home";
	}
	
	@RequestMapping("/tms")
	public String main2() {
		return "pms/home/home";
	}
}
