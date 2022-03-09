package co.test.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.test.prj.project.service.ProjectService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	 @Autowired 
	 ProjectService projectDao;
	 
	
	@RequestMapping("/home")
	public String home(Locale locale, Model model) {
		
		
		  model.addAttribute("mainOfer",projectDao.mainOfrList());
		  model.addAttribute("mainFnd",projectDao.mainFndList());
		
		return "home/home";
	}
	
}
