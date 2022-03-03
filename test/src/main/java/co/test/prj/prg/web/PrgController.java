package co.test.prj.prg.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.test.prj.prg.service.PrgService;
import co.test.prj.prg.service.PrgVO;
import co.test.prj.team.service.MyPrjVO;

@Controller
public class PrgController {

	@Autowired
	private PrgService prgDao;

	@RequestMapping("/progress")
	public String pregress(HttpSession session, Model model) {
		return "pms/prg/prg";
	}

	@RequestMapping("/card")
	public String card(HttpSession session, Model model) {
		return "pms/prg/card";
	}

	@RequestMapping("/prgSelectList")
	@ResponseBody
	public List<PrgVO> prgSelectList(HttpSession session, Model model) {
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		int prj_id = myPrj.getPrj_id();
		List<PrgVO> list = prgDao.prgSelectList(prj_id);
		return list;
	}

	@RequestMapping("/prgInsert")
	public String prgInsert(HttpSession session, Model model, PrgVO prg) {
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		int master_id = myPrj.getMaster_id();
		int prj_id = myPrj.getPrj_id();
		prg.setPrj_id(prj_id);
		prg.setMaster_id(master_id);
		prgDao.prgInsert(prg);
		return "redirect:/card";
	}

	@RequestMapping("/prgUpdate")
	public String prgUpdate(HttpSession session, Model model) {

		return "";
	}

	@RequestMapping("/prgDelete")
	public String prgDelete(HttpSession session, Model model) {

		return "";
	}
}
