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
		System.out.println(user);
		user = userDao.userSelect(user);
		
		if (user != null) {
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_email", user.getUser_email());
			session.setAttribute("user_pwd", user.getUser_pwd());
		
		}else {
			return "user/loginForm";
		}
		return "home/home";
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect : home";
	}
	
	//아이디 중복체크
	@PostMapping("IsIdCheck")
	@ResponseBody
	public boolean IsIdCheck(String user_email) {
		System.out.println(user_email);
		return userDao.isIdCheck(user_email);
	}
	//비밀번호 찾기
	@RequestMapping("/forgotPassword")
	public String forgotPassword() {
		return "user/forgotPassword";
	}
	//아이디찾기
	@RequestMapping("/forgotId")
	public String forgotId() {	
		return "user/forgotId";
	}
	
	//찾은 아이디 결과창
	@RequestMapping("/searchId")
	public String searchId(UserVO user, Model model) {
		
		user = userDao.userSearch(user);
		String s =user.getUser_email().replaceAll("(?<=.{3}).", "*");
		
		if(user.getUser_email() != null) {
			model.addAttribute("idcheck", "당신의 아이디는" + s + "입니다");
		}else {
			model.addAttribute("idcheck", "아이디 찾기 실패하였습니다");
		}
		
		return "user/searchId";
	}
	
	//찾은 비밀번호 결과창
	@RequestMapping("/searchPassword")
	public String searchPassword() {

		return "user/searchPassword";
	}
	// 개발자 등록
	@RequestMapping("/insertdev")
	public String insertdev() {

		return "user/insertdev";
	}
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage() {

		return "user/mypage";
	}
	//회원 업데이트 
	@RequestMapping("/userUpdateForm")
	public String userUpdateForm() {

		return "user/userUpdateForm";
	}
	
	
	
	//개발자 정보 업데이트
	@RequestMapping("/devUpdateForm")
	public String devUpdateForm() {

		return "user/devUpdateForm";
	}
	
	//회원가입
		@RequestMapping("/registerForm")
		public String registerForm() {
			return "user/registerForm";
		}

	// 회원가입
	@PostMapping("/register")
	public String clientRegister(UserVO user, Model model) {
		System.out.println(user);
		user.setUser_ath("user");
		user.setUser_type("0");
		int n = userDao.userInsert(user);
		if (n != 0) {
			model.addAttribute("message", "회원가입 성공하셨습니다.");

		} else {
			model.addAttribute("message", " 회원가입 실패하셨습니다.");
		}
		
		return "redirect:/register2";
	}

	@RequestMapping("/register2")
	public String register2() {
		return "user/register";
	}
	
	// 회원탈퇴1
	@RequestMapping("/Withdrawal")
	public String Withdrawal() {
		
		
		
		return "user/Withdrawal1";
	}

	@RequestMapping("/Withdrawa2")
	public String Withdrawal2() {
		
		
		return "user/Withdrawal2";
	}
	@RequestMapping("/Withdrawa3")
	public String Withdrawal3() {
		
		
		return "user/Withdrawal3";
	}
	@RequestMapping("/myfunding")
	public String myfunding() {
		
		
		return "user/myfunding";
	}
	
}
