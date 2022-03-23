package co.test.prj.pms.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.test.prj.pms.service.ChartVO;
import co.test.prj.pms.service.PmsService;
import co.test.prj.pms.service.PmsVO;

@Controller
public class pmsController {

	@Autowired
	private PmsService pmsDao;

	@RequestMapping("/pms")
	public String main() {
		return "pms/home/home";
	}

	@RequestMapping("/tms")
	public String main2() {
		return "pms/home/home";
	}

	@RequestMapping("/pmsTeamList")
	@ResponseBody
	public List<PmsVO> pmsTeamList(PmsVO pms) {
		List<PmsVO> list = pmsDao.pmsTeamList(pms);
		return list;
	}

	@RequestMapping("/buyList")
	@ResponseBody
	public List<ChartVO> buyList(ChartVO chart) {
		List<ChartVO> list = pmsDao.buyList(chart);
		return list;
	}
}
