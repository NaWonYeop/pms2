package co.test.prj.mypage.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		@RequestMapping("/myfunding")
		public String myfunding() {
			return "mypage/myfunding";
		}
		
}
