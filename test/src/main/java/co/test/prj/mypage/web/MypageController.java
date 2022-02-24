package co.test.prj.mypage.web;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.test.prj.user.service.UserService;
import co.test.prj.user.service.UserVO;

@Controller
public class MypageController {

	// 회원탈퇴1
		@RequestMapping("/Withdrawal")
		public String Withdrawal() {
			return "mypage/Withdrawal1";
		}

		@RequestMapping("/Withdrawa2")
		public String Withdrawal2() {
			return "mypage/Withdrawal2";
		}
		@RequestMapping("/Withdrawa3")
		public String Withdrawal3() {
			return "mypage/Withdrawal3";
		}
}
