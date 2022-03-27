package co.test.prj;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.test.prj.project.service.ProjectService;
import co.test.prj.user.service.UserVO;

@Controller
public class HomeController
{

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	ProjectService projectDao;

	@RequestMapping("/home")
	public String home(Locale locale, Model model, Principal principle, HttpSession session, RedirectAttributes redirect,HttpServletResponse response) throws IOException
	{

		model.addAttribute("mainOfer", projectDao.mainOfrList());
		model.addAttribute("mainFnd", projectDao.mainFndList());

		if (principle != null)
		{
			UserVO usr = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (usr.getUser_ath().equals("ice"))
			{
				System.out.println("동결로그인시 로그아웃처리");
				PrintWriter out=response.getWriter();
				out.println("<script>alert('사용이 불가능한 계정입니다. 관리자에게 문의해주세요.');</script>");
				out.flush();
				return "home/logout";
			}
			session.setAttribute("sessionUser", usr);
		}

		return "home/home";
	}

}
