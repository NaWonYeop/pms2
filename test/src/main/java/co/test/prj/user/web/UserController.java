package co.test.prj.user.web;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.test.prj.project.service.ProjectVO;
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
	public String login(UserVO user, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println(user);
		user = userDao.userSelect(user);
		if (user != null) {
			user = userDao.userSelect(user);
			session.setAttribute("sessionUser", user);
			return "redirect:/home";
		} else {
			model.addAttribute("loginFail", "1");

			return "user/loginForm";
		}
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}

	// 아이디 중복체크
	@PostMapping("IsIdCheck")
	@ResponseBody
	public String IsIdCheck(String user_email, HttpSession session) {
		System.out.println(user_email);
		String location = null;
		if (!userDao.isIdCheck(user_email)) {
			session.setAttribute("user_email", user_email);
			location = "loginForm";
		} else {
			session.setAttribute("user_email", user_email);
			session.setAttribute("user_type", 2);
			location = "registerForm";
			// 겟매핑 이메일가져와서 레지스터폼으로넘기기

		}

		return location;

	}

	// 비밀번호 찾기폼
	@RequestMapping("/forgotPassword")
	public String forgotPassword() {
		return "user/forgotPassword";
	}

	@RequestMapping("/forgotPassword2")
	public String forgotPassword(@RequestParam("passwordFail") String fail, Model model) {
		if (fail != null) {
			model.addAttribute("passwordFail", "1");
		}
		return "user/forgotPassword";
	}

	// 아이디찾기폼
	@RequestMapping("/forgotId")
	public String forgotId() {
		return "user/forgotId";
	}

	// 찾은 아이디 결과창
	@RequestMapping("/searchId")
	public String searchId(UserVO user, Model model) {
		user = userDao.userSearch(user);
		if (user.getUser_email() != null) {
			String s = user.getUser_email().replaceAll("(?<=.{3}).", "*");
			model.addAttribute("idcheck", "당신의 아이디는" + s + "입니다");
		} else {
			model.addAttribute("idcheck", "아이디 찾기 실패하였습니다");
		}

		return "user/searchId";
	}

	// 찾은 비밀번호 결과창
	@RequestMapping("/searchPassword")
	public String searchPassword(UserVO user, Model model, RedirectAttributes re) {
		user = userDao.searchPwd(user);
		System.out.println(user);
		if (user != null) {
			String email = user.getUser_email();
			String pw = "";
			for (int i = 0; i < 6; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			user.setUser_pwd(pw);
			userDao.userUpdate(user);
			try {

				// int index = username.indexOf("@");
				// int indexPw = password.indexOf(",");
				String id = "tyi020382";// id
				String pwd = "dkskalclrptsp12!";// 비번 입력해야됨
				String host = "smtp.naver.com";
				// 네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
				// 네이버 이메일 비밀번호를 기재합니다.
				int port = 465;
				// 메일 내용
				// 메일을 발송할 이메일 주소를 기재해 줍니다.
				Properties props = System.getProperties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", host);
				props.put("mail.debug", "true");
				/*
				 * System.out.println(password); System.out.println(username.substring(0,
				 * index));
				 */
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {

					// String un=username.substring(0, index);
					// String pw=password.substring(0,indexPw);
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(id, pwd);
					}
				});
				session.setDebug(true);
				// for debug
				Message mimeMessage = new MimeMessage(session);
				mimeMessage.setFrom(new InternetAddress(id + "@naver.com"));// 보내는사람 주소
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));// 받는사람 주소
				mimeMessage.setSubject("임시비밀번호입니다");
				mimeMessage.setText(email + "님의 임시비밀번호는" + pw + "입니다");
				Transport.send(mimeMessage);

			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("passwordFail", "임시 비밀번호를 발송하였습니다");
			return "redirect:/searchPassword2";
		} else {
			re.addAttribute("passwordFail", "1");
			return "redirect:/forgotPassword2";
		}

	}

	@RequestMapping("/searchPassword2")
	public String searchPassword2() {
		return "user/searchPassword";
	}

	// 개발자 등록
	@RequestMapping("/insertdev")
	public String insertdev() {

		return "user/insertdev";
	}

	// 마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session ) {
		
		return "user/mypage";
	}

	// 회원 업데이트
	@RequestMapping("/userUpdateForm")
	public String userUpdateForm(Model model, HttpSession session) {
		return "user/userUpdateForm";
	}

	// 회원정보 수정
	@PostMapping("/userUpdate")
	public String userUpdate(UserVO user, Model model, HttpSession session) {
		System.out.println(user);
		user.setUser_email(session.getAttribute("user_email").toString());
		if (user.getUser_pwd() != null) {
			model.addAttribute("update", "회원수정 성공하였습니다");
			userDao.userUpdate(user);

		} else {
			model.addAttribute("update", "회원수정 실패하였습니다");
		}
		return "user/userUpdate";
	}

	// 개발자 정보 업데이트
	@RequestMapping("/devUpdateForm")
	public String devUpdateForm() {

		return "user/devUpdateForm";
	}

	// 회원가입
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "user/registerForm";
	}

	// 회원가입
	@PostMapping("/register")
	public String clientRegister(UserVO user, Model model, RedirectAttributes re) {
		System.out.println(user);
		user.setUser_ath("user");
		user.setUser_type("0");
		int n = userDao.userInsert(user);
		if (n != 0) {
			re.addAttribute("message", "회원가입 성공하셨습니다");
			return "redirect:/register2";
		} else {
			model.addAttribute("message", " 회원가입 실패하셨습니다.");
			return "user/registerForm";
		}

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
	public String Withdrawal2(String user_pwd, Model model, HttpSession session) {
		if (user_pwd.equals(session.getAttribute("user_pwd"))) {
			return "user/Withdrawal2";
		} else {
			// 메시지 넣기
		}

		// 비밀번호 값을 들고온다 세션비밀번호, 비밀번호비교 같으면 이회원을 펀딩리스트 어트리뷰트에담는다 3에보낸다 틀리면
		return "user/Withdrawal2";
	}

	@RequestMapping("/Withdrawa3")
	public String Withdrawal3(HttpSession session) {
		UserVO user = new UserVO();
		user.setUser_id((int) session.getAttribute("user_id"));
		userDao.userDelete(user);
		return "user/Withdrawal3";
	}

	@RequestMapping("/myfunding")
	public String myfunding() {

		return "user/myfunding";
	}

}
