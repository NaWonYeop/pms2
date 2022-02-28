package co.test.prj.project.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.test.prj.project.service.ProjectVO;

@Controller
public class ProjectController {
	
	@RequestMapping("/projectInsertForm")
	public String main() {
		return "project/projectInsertForm";
	}
	
	@PostMapping("/projectInsert")
	public int projectInsert (MultipartFile mul, ProjectVO project, HttpSession session) {
		System.out.println("인서트 되냐?");
		
		
		
		return 0;
	}

}
