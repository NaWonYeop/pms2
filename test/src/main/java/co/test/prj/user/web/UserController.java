package co.test.prj.user.web;

import java.util.List;
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
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.test.prj.application.service.AppVO;
import co.test.prj.certificate.service.CertService;
import co.test.prj.certificate.service.CertVO;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.security.cunstomUser;
import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userDao;
	@Autowired
	private cunstomUser cusd;

	@Autowired
	private CertService certDao;

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
	public String IsIdCheck(HttpServletRequest request, String user_email, HttpSession session) {

		System.out.println(user_email);
		String location = null;
		if (user_email.indexOf("@") == -1) {
			location = "Fail";
		} else if (!userDao.isIdCheck(user_email)) {
			// 카카오 로그인 부분
			UserDetails kakaoVO = (UserDetails) cusd.loadUserByUsername(user_email);
			Authentication authentication = new UsernamePasswordAuthenticationToken(kakaoVO, kakaoVO.getPassword(),
					kakaoVO.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			session = request.getSession(true);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);

			UserVO user = new UserVO();
			user.setUser_email(user_email);
			session.setAttribute("sessionUser", userDao.userSelect(user));
			location = "home";
		} else {
			session.setAttribute("user_email", user_email);

			location = "kakaoRegisterForm";
			// 겟매핑 이메일가져와서 레지스터폼으로넘기기

		}

		return location;

	}

	// 카카오 회원가입폼
	@RequestMapping("/kakaoRegisterForm")
	public String kakaoRegisterForm() {
		return "user/kakaoRegisterForm";
	}

	// 일반회원 아이디체크
	@PostMapping("/nomalIdCheck")
	@ResponseBody
	public boolean nomalIdCheck(String user_email) {
		return userDao.nomalCheck(user_email);
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
		if (user != null) {
			String s = user.getUser_email().replaceAll("(?<=.{3}).", "*");
			model.addAttribute("idcheck", "당신의 아이디는" + s + "입니다");
			return "user/searchId";
		} else {
			model.addAttribute("idcheck", "1");
		}
		return "user/forgotId";

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
			BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
			user.setUser_pwd(scpwd.encode(pw));

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
	@RequestMapping("/insertDevForm")
	public String insertdev(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		user = userDao.userSelect(user);
		if (user.getUser_job_ttl() != null) {
			return "redirect:/home";
			// 토스트 넣어야됨
		}
		return "user/insertDevForm";
	}

	// 개발자 등록
	@RequestMapping("/insertDev")
	public String insertDevForm(UserVO vo, HttpSession session, Model model,
			@RequestParam("cert_name") List<String> list) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		vo.setUser_ath("developer");
		vo.setUser_id(user.getUser_id());
		userDao.userUpdate(vo);
		for (String temp : list) {
			System.out.println(temp);
			CertVO cert = new CertVO();
			cert.setCert_name(temp);
			cert.setUser_id(user.getUser_id());
			userDao.insertDev(cert);
		}
		return "user/insertDev";
	}

	// 마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		List<ProjectVO> list = userDao.MyProject(user);
		model.addAttribute("MyProject", list);
		List<ProjectVO> funding = userDao.MyFunding(user);
		model.addAttribute("MyFunding", funding);
		List<AppVO> app = userDao.MyApp(user);
		model.addAttribute("MyApp", app);

		return "user/mypage";
	}

	// 개인정보 수정전 비밀번호 확인
	@RequestMapping("/mycheckUserPassword")
	public String checkUserPassword(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		if (user != null) {
			return "user/checkUserPassword";
		} else {
			return "redirect:/home";
		}
	}

	// 회원 업데이트
	@RequestMapping("/userUpdateForm")
	public String userUpdateForm(String user_pwd, Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		if (scpwd.matches(user_pwd,user.getUser_pwd())) {
			return "user/userUpdateForm";
		} else {
			model.addAttribute("FailCheckPassword", "1");
			return "redirect:/mycheckUserPassword2";
		}

	}

	@RequestMapping("/mycheckUserPassword2")
	public String checkUserPassword2(@RequestParam("FailCheckPassword") String Fail, Model model) {
		if (Fail != null) {
			model.addAttribute("FailCheckPassword", "1");
		}
		return "user/checkUserPassword";
	}

	// 회원정보 수정
	@PostMapping("/userUpdate")
	public String userUpdate(UserVO user, Model model, HttpSession session) {
		System.out.println(user);
		UserVO vo = new UserVO();
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo = (UserVO) session.getAttribute("sessionUser");
		user.setUser_id(vo.getUser_id());
		if (user.getUser_pwd() != null) {
			model.addAttribute("update", "회원수정 성공하였습니다");
			user.setUser_pwd(scpwd.encode(user.getUser_pwd()));
			userDao.userUpdate(user);
		} else {
			model.addAttribute("update", "회원수정 실패하였습니다");
		}
		return "user/userUpdate";
	}

	// 개발자 정보 업데이트
	@RequestMapping("/devUpdateForm")
	public String devUpdateForm(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		CertVO cert = new CertVO();
		cert.setUser_id(user.getUser_id());
		List<CertVO> certifi = certDao.certSelect(cert);
		model.addAttribute("MyCert", certifi);
		return "user/devUpdateForm";
	}

	// 개발자 정보 업데이트 결과창
	@PostMapping("/devUpdate")
	public String devUpdate(UserVO vo,HttpSession session, Model model, @RequestParam("cert_name") List<String> list) {
		
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		vo.setUser_id(user.getUser_id());
		userDao.userUpdate(vo);
		CertVO del = new CertVO();
		del.setUser_id(user.getUser_id());
		userDao.deleteDev(del);
		for (String temp : list) {
			System.out.println(temp);
			CertVO cert = new CertVO();
			cert.setUser_id(user.getUser_id());
			cert.setCert_name(temp);
			userDao.insertDev(cert);
		}

		return "user/devUpdate";
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

		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		user.setUser_pwd(scpwd.encode(user.getUser_pwd()));

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
	@RequestMapping("/myWithdrawal")
	public String Withdrawal() {
		return "user/Withdrawal1";
	}

	// 회원탈퇴2
	@RequestMapping("/myWithdrawa2")
	public String Withdrawal2(String user_pwd, Model model, HttpSession session) {
		System.out.println(user_pwd);
		if (user_pwd == null) {
			return "redirect:/home";
		}
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		userDao.userSelect(user);
		if (scpwd.matches(user_pwd,user.getUser_pwd())) {
			System.out.println(scpwd.matches(user_pwd,user.getUser_pwd()));
			int id = user.getUser_id();
			model.addAttribute("funding", userDao.MyfundingList(id));
			return "user/Withdrawal2";
		} else {
			model.addAttribute("FailPassword", "비밀번호가 일치하지않습니다");
		}
		return "user/Withdrawal1";
	}

	// 회원탈퇴 결과창
	@RequestMapping("/myWithdrawa3")
	public String Withdrawal3(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		UserVO user1 = new UserVO();
		user1.setUser_id(user.getUser_id());
		userDao.userDelete(user);
		session.invalidate();
		return "user/Withdrawal3";
	}

	// 카카오 회원탈퇴
	@RequestMapping("/kakaoWithdrawal")
	public String kakaoWithdrawal() {
		return "user/kakaoWithdrawal1";
	}

	// 회원탈퇴2
	@RequestMapping("/kakaoWithdrawa2")
	public String kakaoWithdrawal2(String user_email, Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		if (user_email.equals(user.getUser_email())) {
			System.out.println("user_email");
			int id = user.getUser_id();
			model.addAttribute("funding", userDao.MyfundingList(id));
			return "user/kakaoWithdrawal2";
		} else {
			model.addAttribute("FailPassword", "비밀번호가 일치하지않습니다");
		}

		return "user/kakaoWithdrawal1";
	}

	// 펀딩리스트
	@RequestMapping("/myfunding")
	public String myfunding(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		int id = user.getUser_id();
		model.addAttribute("funding", userDao.MyfundingList(id));

		return "user/myfunding";
	}

	// 프로젝트관리
	@RequestMapping("/myProject")
	public String myProject(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		int id = user.getUser_id();
		model.addAttribute("enterProject", userDao.MyJoinProject(id));
		model.addAttribute("Myproject", userDao.MyInsertProject(id));

		return "user/myProject";
	}

	@RequestMapping("/MyAppDown")
	@ResponseBody
	public void MyAppDown(int id) {
		userDao.AppUpdate(id);

	}

	// 관리자페이지
	@RequestMapping("/adminUser")
	public String adminUser(Model model) {
		model.addAttribute("AdminUser", userDao.AdminUserList());
		return "admin/adminUser";
	}

	@RequestMapping("/adminIce")
	@ResponseBody
	public String adminIce(UserVO vo) {

		UserVO user = userDao.userSelect(vo);
		String ath = user.getUser_ath();
		System.out.println(ath);
		if (ath.equals("ice")) {
			System.out.println("여기 와야됨!!!!");
			String job = user.getUser_job_ttl();
			if (job == null) {
				ath = "user";
			} else {
				ath = "developer";
			}
		} else {
			ath = "ice";
		}
		user.setUser_ath(ath);
		userDao.userUpdate(user);
		return ath;
	}
}
