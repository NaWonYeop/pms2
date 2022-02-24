package co.test.prj.project.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("/project")
	public String main() {
		return "project/bordtest";
	}

}
