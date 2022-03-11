package co.test.prj.prg.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.test.prj.MyUtill;
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

	@RequestMapping("/toDoSelect")
	@ResponseBody
	public List<PrgVO> toDoSelect(HttpSession session, PrgVO prg) {
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		int prj_id = myPrj.getPrj_id();
		prg.setPrj_id(prj_id);
		List<PrgVO> list = prgDao.toDoSelect(prg);
		return list;
	}

	@RequestMapping("/calSelectList")
	@ResponseBody
	public List<PrgVO> calSelectList(HttpSession session, Model model) {
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		int prj_id = myPrj.getPrj_id();
		List<PrgVO> list = prgDao.calSelectList(prj_id);
		return list;
	}

	@RequestMapping("/prgInsert")
	@ResponseBody
	public String prgInsert(HttpSession session, @RequestParam("prg_content") String prg_content,
			@RequestParam(value = "prg_str", required = false) String prg_str,
			@RequestParam(value = "prg_ed", required = false) String prg_ed,
			@RequestParam(value = "prg_manager", required = false) String prg_manager,
			@RequestParam(value = "prg_user", required = false) String prg_user) {
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		int master_id = myPrj.getMaster_id();
		int prj_id = myPrj.getPrj_id();

		PrgVO prg = new PrgVO();

		prg.setPrj_id(prj_id);
		prg.setMaster_id(master_id);
		prg.setPrg_content(prg_content);
		System.out.println("prg_str" + prg_str);
		System.out.println("prg_ed" + prg_ed);
		prg.setPrg_str(MyUtill.convertStringtoDate(prg_str));
		prg.setPrg_ed(MyUtill.convertStringtoDate(prg_ed));
		System.out.println("prg_str after" + MyUtill.convertStringtoDate(prg_str));
		System.out.println("prg_ed after" + MyUtill.convertStringtoDate(prg_ed));
		prg.setPrg_manager(prg_manager);
		prg.setPrg_user(prg_user);
		System.out.println("prg_user: " + prg_user);

		int count = prgDao.prgInsert(prg);
		String result = null;
		if (count > 0) {
			result = "success";
		} else {
			result = "fail";
		}

		return result;
	}

	@RequestMapping("/prgUpdate")
	@ResponseBody
	public String smlUpdate(HttpSession session, PrgVO prg) {
		int count = prgDao.prgUpdate(prg);
		String result = null;
		if (count > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

	@RequestMapping("/midDelete")
	@ResponseBody
	public String midDelete(HttpSession session, PrgVO prg) {
		MyPrjVO myPrj = (MyPrjVO) session.getAttribute("myPrj");
		int prj_id = myPrj.getPrj_id();
		prg.setPrj_id(prj_id);
		String result = "";

		int min = prgDao.selectPrgID(prg);
		if (min != prg.getPrg_id()) {
			prgDao.smlUpdate(prg);
			prgDao.prgDelete(prg);
			result = "success";
		} else {
			result = "fail";
		}

		return result;
	}

	@RequestMapping("/prgDelete")
	@ResponseBody
	public String prgDelete(HttpSession session, PrgVO prg) {
		int count = prgDao.prgDelete(prg);
		String result = null;
		if (count > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

	@RequestMapping("/smlCheck")
	@ResponseBody
	public String smlCheck(PrgVO prg) {
		int count = prgDao.smlCheck(prg);
		String result = null;
		if (count > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}
}
