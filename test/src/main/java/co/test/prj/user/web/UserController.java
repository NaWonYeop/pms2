package co.test.prj.user.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userDao;

	// 로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	// 로그인
	@PostMapping("/login")
	public String login(UserVO user, HttpSession session) {
		user = userDao.userSelect(user);
		if (user != null) {
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_email", user.getUser_email());
			session.setAttribute("user_pwd", user.getUser_pwd());

		} else {
			return "user/loginForm";

		}
		return "redirect:main";
	}

	@RequestMapping("/registerForm")
	public String registerForm() {
		return "user/registerForm";
	}

	@PostMapping("IsIdCheck")
	@ResponseBody
	public boolean IsIdCheck(String user_email) {
		System.out.println(user_email);
		return userDao.isIdCheck(user_email);
	}
	
	
	@RequestMapping("/forgotPassword")
	public String forgotPassword() {
		return "user/forgotPassword";
	}
	
	@RequestMapping("/forgotId")
	public String forgotId() {
		return "user/forgotId";
	}
	@RequestMapping("/searchId")
	public String searchId() {
		return "user/searchId";
	}
	@RequestMapping("/searchPassword")
	public String searchPassword() {
		
		return "user/searchPassword";
	}
	
	@RequestMapping("/insertdev")
	public String insertdev() {
		
		return "user/insertdev";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		
		return "user/mypage";
	}
	
	@RequestMapping("/userUpdateForm")
	public String userUpdateForm() {
		
		return "user/userUpdateForm";
	}
	
	@RequestMapping("/devUpdateForm")
	public String devUpdateForm() {
		
		return "user/devUpdateForm";
	}
	
	
	   // 회원가입
	   @PostMapping("/register")
	   public String clientRegister(UserVO user, Model model) {
	      int n = userDao.userInsert(user);
	      if (n != 0) {
	         model.addAttribute("message", "회원가입 성공하셨습니다.");

	      } else {
	         model.addAttribute("message", " 회원가입 실패하셨습니다.");
	      }

	      return "user/register";
	   }

}
