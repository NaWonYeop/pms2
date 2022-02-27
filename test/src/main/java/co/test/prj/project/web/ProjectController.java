package co.test.prj.project.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("/projectInsert")
	public String main() {
		return "project/projectInsert";
	}

}
