package co.test.prj.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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

import co.test.prj.application.service.AppService;
import co.test.prj.application.service.AppVO;
import co.test.prj.certificate.service.CertService;
import co.test.prj.certificate.service.CertVO;
import co.test.prj.project.service.ProjectService;
import co.test.prj.project.service.ProjectVO;
import co.test.prj.security.cunstomUser;
import co.test.prj.team.service.TeamService;
import co.test.prj.team.service.TeamVO;
import co.test.prj.tech.service.TechService;
import co.test.prj.tech.service.TechVO;
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
	
	@Autowired
	private ProjectService projectDao;
	
	@Autowired 
	private AppService appDao;
	
	@Autowired 
	private TeamService teamDao;
	
	@Autowired
	private TechService techDao;
	// ????????????
	@RequestMapping("/loginForm")
	public String loginForm(Model model,String fail) {
		if(fail != null)
		{
			model.addAttribute("loginFail","1");
		}
		return "user/loginForm";
	}
	@RequestMapping("/loginerror")
	public String loginerror() {
		return "user/loginerror";
	}
	// ?????????
	@PostMapping("/login")
	public String login(UserVO user, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println(user);
		user = userDao.userSelect(user);
		session.setAttribute("sessionUser", user);
		if (user != null) {
			user = userDao.userSelect(user);
			return "redirect:/logout";
		} else {
			
			
			return "user/loginForm";
		}
	}

	// ????????????
	/*
	 * @RequestMapping("logout") public String logout(HttpSession session) {
	 * session.invalidate();
	 * 
	 * return "redirect:/home"; }
	 */

	// ????????? ????????????
	@PostMapping("IsIdCheck")
	@ResponseBody
	public String IsIdCheck(HttpServletRequest request, String user_email, HttpSession session) {

		System.out.println(user_email);
		String location = null;
		if (user_email.indexOf("@") == -1) {
			location = "Fail";
		} else if (!userDao.isIdCheck(user_email)) {
			// ????????? ????????? ??????
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
			// ????????? ????????????????????? ??????????????????????????????

		}

		return location;

	}

	// ????????? ???????????????
	@RequestMapping("/kakaoRegisterForm")
	public String kakaoRegisterForm() {
		return "user/kakaoRegisterForm";
	}

	// ???????????? ???????????????
	@PostMapping("/nomalIdCheck")
	@ResponseBody
	public boolean nomalIdCheck(String user_email) {
		return userDao.nomalCheck(user_email);
	}

	// ???????????? ?????????
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

	// ??????????????????
	@RequestMapping("/forgotId")
	public String forgotId() {
		return "user/forgotId";
	}

	// ?????? ????????? ?????????
	@RequestMapping("/searchId")
	public String searchId(UserVO user, Model model) {
		user = userDao.userSearch(user);
		if (user != null) {
			String s = user.getUser_email().replaceAll("(?<=.{3}).", "*");
			model.addAttribute("idcheck", "????????? ????????????" + s + "?????????");
			return "user/searchId";
		} else {
			model.addAttribute("idcheck", "1");
		}
		return "user/forgotId";

	}

	// ?????? ???????????? ?????????
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
				String pwd = "dkskalclrptsp12!";// ?????? ???????????????
				String host = "smtp.naver.com";
				// ????????? ????????? ????????? @ naver.com???????????? ???????????????.
				// ????????? ????????? ??????????????? ???????????????.
				int port = 465;
				// ?????? ??????
				// ????????? ????????? ????????? ????????? ????????? ?????????.
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
				mimeMessage.setFrom(new InternetAddress(id + "@naver.com"));// ??????????????? ??????
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));// ???????????? ??????
				mimeMessage.setSubject("???????????????????????????");
				mimeMessage.setText(email + "?????? ?????????????????????" + pw + "?????????");
				Transport.send(mimeMessage);

			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("passwordFail", "?????? ??????????????? ?????????????????????");
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

	// ????????? ??????
	@RequestMapping("/insertDevForm")
	public String insertdev(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		user = userDao.userSelect(user);
	
		
		return "user/insertDevForm";
	}

	// ????????? ??????
	@RequestMapping("/insertDev")
	public String insertDevForm(UserVO vo, HttpSession session, Model model,
			@RequestParam("cert_name") List<String> list,@RequestParam("tech_name") List<String> list2,Principal principal) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		vo.setUser_ath("developer");
		vo.setUser_id(user.getUser_id());
		session.setAttribute("sessionUser", user);
		userDao.userUpdate(vo);
		if(list.size()> 1) {
			list.remove(list.size()-1);
		}
		for (String temp : list) {
			System.out.println(temp);
			CertVO cert = new CertVO();
			cert.setCert_name(temp);
			cert.setUser_id(user.getUser_id());
			userDao.insertDev(cert);
		}
		System.out.println(list2);
		if(list2.size()> 1) {
			list2.remove(list2.size()-1);
		}
		for (String temp : list2) {
			System.out.println(temp);
			TechVO tech= new TechVO();
			tech.setUser_id2(user.getUser_id());
			tech.setTech_name(temp);
			techDao.insertTech(tech);
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		List<GrantedAuthority> updatedAuthorities = new ArrayList<>();
		updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_DEVELOPER")); 

		Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);

		SecurityContextHolder.getContext().setAuthentication(newAuth);

		return "user/insertDev";
	}

	// ???????????????
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

	// ???????????? ????????? ???????????? ??????
	@RequestMapping("/mycheckUserPassword")
	public String checkUserPassword(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		if (user != null) {
			return "user/checkUserPassword";
		} else {
			return "redirect:/home";
		}
	}

	// ?????? ????????????
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

	// ???????????? ??????
	@PostMapping("/userUpdate")
	public String userUpdate(UserVO user, Model model, HttpSession session) {
		System.out.println(user);
		UserVO vo = new UserVO();
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo = (UserVO) session.getAttribute("sessionUser");
		user.setUser_id(vo.getUser_id());
		if (user.getUser_pwd() != null) {
			model.addAttribute("update", "???????????? ?????????????????????");
			user.setUser_pwd(scpwd.encode(user.getUser_pwd()));
			userDao.userUpdate(user);
			return "redirect:/logout";
		} else {
			model.addAttribute("update", "???????????? ?????????????????????");
		}
		return "user/userUpdate";
	}

	// ????????? ?????? ????????????
	@RequestMapping("/devUpdateForm")
	public String devUpdateForm(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		CertVO cert = new CertVO();
		TechVO tech = new TechVO();
		cert.setUser_id(user.getUser_id());
		tech.setUser_id2(user.getUser_id());
		List<CertVO> certifi = certDao.certSelect(cert);
		model.addAttribute("MyCert", certifi);
		List<TechVO> tech2=techDao.techSelect(tech);
		model.addAttribute("MyTech", tech2);
		return "user/devUpdateForm";
	}

	// ????????? ?????? ???????????? ?????????
	@PostMapping("/devUpdate")
	public String devUpdate(UserVO vo,HttpSession session, Model model, @RequestParam("cert_name") List<String> list,@RequestParam("tech_name") List<String> list2) {
		
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		vo.setUser_id(user.getUser_id());
		userDao.userUpdate(vo);
		CertVO del = new CertVO();
		del.setUser_id(user.getUser_id());
		TechVO delT= new TechVO();
		delT.setUser_id2(user.getUser_id());
		userDao.deleteDev(del);
		techDao.deleteTech(delT);
		System.out.println(list);
		if(list.size()> 1) {
			list.remove("??????");
		}
		for (String temp : list) {
			System.out.println(temp);
			CertVO cert = new CertVO();
			cert.setUser_id(user.getUser_id());
			cert.setCert_name(temp);
			userDao.insertDev(cert);
		}
		if(list2.size()> 1) {
			list2.remove("??????");
		}
		for (String temp : list2) {
			System.out.println(temp);
			TechVO tech= new TechVO();
			tech.setUser_id2(user.getUser_id());
			tech.setTech_name(temp);
			techDao.insertTech(tech);
		}
		return "user/devUpdate";
	}

	// ????????????
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "user/registerForm";
	}

	// ????????????
	@PostMapping("/register")
	public String clientRegister(UserVO user, Model model, RedirectAttributes re) {
		System.out.println(user);
		user.setUser_ath("user");
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		user.setUser_pwd(scpwd.encode(user.getUser_pwd()));
		if(user.getEther_id()==null) {
			user.setEther_id("??????");
		}
		int n = userDao.userInsert(user);
		if (n != 0) {
			re.addAttribute("message", "???????????? ?????????????????????");
			return "redirect:/register2";
		} else {
			model.addAttribute("message", " ???????????? ?????????????????????.");
			return "user/registerForm";
		}

	}

	@RequestMapping("/register2")
	public String register2() {
		return "user/register";
	}

	// ????????????1
	@RequestMapping("/myWithdrawal")
	public String Withdrawal() {
		return "user/Withdrawal1";
	}

	// ????????????2
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
			model.addAttribute("FailPassword", "??????????????? ????????????????????????");
		}
		return "user/Withdrawal1";
	}

	// ???????????? ?????????
	@RequestMapping("/myWithdrawa3")
	public String Withdrawal3(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		UserVO user1 = new UserVO();
		user1.setUser_id(user.getUser_id());
		userDao.userDelete(user);
		
		return "redirect:/logout";
	}

	// ????????? ????????????
	@RequestMapping("/kakaoWithdrawal")
	public String kakaoWithdrawal() {
		return "user/kakaoWithdrawal1";
	}

	// ????????????2
	@RequestMapping("/kakaoWithdrawa2")
	public String kakaoWithdrawal2(String user_email, Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		if (user_email.equals(user.getUser_email())) {
			System.out.println("user_email");
			int id = user.getUser_id();
			model.addAttribute("funding", userDao.MyfundingList(id));
			return "user/kakaoWithdrawal2";
		} else {
			model.addAttribute("FailPassword", "??????????????? ????????????????????????");
		}

		return "user/kakaoWithdrawal1";
	}

	// ???????????????
	@RequestMapping("/myfunding")
	public String myfunding(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		int id = user.getUser_id();
		model.addAttribute("funding", userDao.MyfundingList(id));

		return "user/myfunding";
	}

	// ??????????????????
	@RequestMapping("/myProject")
	public String myProject(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		int id = user.getUser_id();
		ProjectVO ve=new ProjectVO();
		
		model.addAttribute("enterProject", userDao.MyJoinProject(id));
		model.addAttribute("Myproject", userDao.MyInsertProject(id));

		return "user/myProject";
	}

	@RequestMapping("/MyAppDown")
	@ResponseBody
	public void MyAppDown(int id) {
		userDao.AppUpdate(id);

	}

	// ??????????????????
	@RequestMapping("/adminUser")
	public String adminUser(Model model) {
		model.addAttribute("AdminUser", userDao.AdminUserList());
		return "admin/adminUser";
	}
	//???????????? ???????????????
	@RequestMapping("/conFirmSelect")
	public String conFirm(int prj_id,int app_id, Model model, ProjectVO project) {
		project.setPrj_id(prj_id);
		ProjectVO prj = projectDao.projectSelect(project);
		model.addAttribute("App", app_id);
		model.addAttribute("project", prj);
		System.out.println(app_id);
		return "user/projectSelect";
	}
	//???????????? ?????? 
	@RequestMapping("/conFirm")
	public String confirm(int app_id, Model model, AppVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("sessionUser");
		vo.setApp_id(app_id);
		vo.setApp_stt("ok");
		appDao.appUpdate(vo);
		vo = appDao.appliSelect(vo);
		TeamVO team = new TeamVO();
		team.setUser_id(user.getUser_id());
		team.setMaster_id(vo.getMaster_id());
		team.setPrj_id(vo.getPrj_id());
		teamDao.teamInsert(team);
		return "redirect:/mypage";
	}
	@RequestMapping("/refuse")
	public String refuse(int app_id, Model model, AppVO vo) {
		vo.setApp_id(app_id);
		vo.setApp_stt("no");
		appDao.appUpdate(vo);
		vo = appDao.appliSelect(vo);
		return "redirect:/mypage";
	}
	

	@RequestMapping("/adminIce")
	@ResponseBody
	public String adminIce(UserVO vo) {

		UserVO user = userDao.userSelect(vo);
		String ath = user.getUser_ath();
		System.out.println(ath);
		if (ath.equals("ice")) {
			System.out.println("?????? ?????????!!!!");
			String job = user.getUser_crr();
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
