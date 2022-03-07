package co.test.prj.project.web;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.test.prj.comtf.service.ComtfService;
import co.test.prj.comtf.service.ComtfVO;
import co.test.prj.project.service.ProjectService;
import co.test.prj.project.service.ProjectVO;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectDao;
	
	@Autowired
	private ComtfService comtfDao;
	
	@RequestMapping("/projectInsertForm")
	public String main() {
		return "project/projectInsertForm";
	}
	
	@PostMapping("/projectInsert")
	public String projectInsert (
			@RequestParam("mul") MultipartFile multi, 
			ProjectVO project, ComtfVO comtf, 
			HttpSession session, 
			HttpServletRequest hreq,
			Model model) {
		System.out.println("인서트 되냐?");
		
		int pId = projectDao.projectMaxPId();
		project.setPrj_id(pId);
		System.out.println("pId : " + pId );
		
		//멀티파트 사진 들어올때
		int fNum = comtfDao.comtfCountMax(); //파일 번호 CTF_ID
		System.out.println(fNum);
		String oriThuName = multi.getOriginalFilename(); //원파일명 CTF_ORU_NAME
		System.out.println("원파일명 : " + oriThuName);
		if (!oriThuName.isEmpty()) {
			System.out.println("사진들어오냐?");
			String tuuid = UUID.randomUUID().toString();
			String savThuName = tuuid + oriThuName.substring(oriThuName.lastIndexOf(".")); //저장할 파일명 CTF_ST_NAME
			System.out.println("저장파일명 : " + savThuName);
	
			String path = hreq.getServletContext().getRealPath("\\resources\\upload"); 
			String path2 = path.replace("\\", "/");
			String uploadDir = path2 + "/images/";  //저장경로 CTF_USECTF_ST_COURSE
			System.out.println("경로 : "+ uploadDir);
			
			project.setCtf_id(fNum);
			
			//사진 등록
			comtf.setCtf_id(fNum);
			comtf.setCtf_oru_name(oriThuName);
			comtf.setCtf_st_name(savThuName);
			comtf.setCtf_usectf_st_course(uploadDir);
			
			comtfDao.comtfInsert(comtf);
			
			try {
				multi.transferTo(new File(uploadDir, savThuName));
			} catch (Exception e) {
				System.out.println("이미지 저장시 오류생김");
				e.printStackTrace();
			} 
		
		} else {
			System.out.println("사진없냐?");
		}
		
		//프로젝트 등록
		projectDao.projectInsert(project);
		
		System.out.println(project.getPrj_name());
		System.out.println(project.getPrj_fnd_prop());
		
		//펀딩 유무 ~> 리워드 보냄
		if (project.getPrj_fnd_prop() == 0) {
			System.out.println("펀딩안하면");
			
			project.setPrj_id(pId);
			
			model.addAttribute("project",projectDao.projectSelect(project));
			
			//나중에 전체목록 만들면 그곳으로 경로 변경할것
			return "project/projectSelect";
		} else {
			System.out.println("펀딩하면");
			
			session.setAttribute("sessionMId", project.getMaster_id());
			session.setAttribute("sessionPId", pId);
			
			System.out.println("session등록 ~ sessionMId : "+ project.getMaster_id()+", sessionPId : "+ pId);
			
			return "redirect:/rewardInsertForm";
		}
		
		
	}
	
	//메인, 구인, 펀딩, 검색 조회 리스트 페이지로 사용할것
	// /projectSearchPage?type=&keyword=&pageNum=1&amount=5 전체검색
	// /projectSearchPage?type=fnd&keyword=&pageNum=1&amount=5 펀딩
	// /projectSearchPage?type=ofr&keyword=&pageNum=1&amount=5 구인
	@RequestMapping("/projectSearchPage")
	private String searchPage(
			@RequestParam("type") String type, 
			@RequestParam("keyword") String keyword,
			@RequestParam("pageNum") int pageNum, 
			@RequestParam("amount") int amount, 
			ProjectVO project, 
			Model model) {
		Map<String, Object> map = new HashedMap();
		System.out.println("검색 들어오는곳");
		String gettype = type;
		String getkeyword = keyword;

		// 공백 제거 (trim())
		String trimkeyword = getkeyword.trim();
		// 공백 제거 문자열 출력
		System.out.println("원 검색어 : '" + getkeyword + "'");
		System.out.println("trim 검색어 : '" + trimkeyword + "'");

		System.out.println("검색 타입 : " + gettype + ", 검색어 : " + trimkeyword);

		project.setType(gettype);
		project.setKeyword(trimkeyword);

		// 페이지 처리
		int getpageNum = pageNum; // 시작 페이지 번호
		int getamount = amount; // 한페이지에 보여줄 건수

		System.out.println("시작 페이지 번호 : " + getpageNum + ", 한페이지에 보여줄 건수 : " + getamount);

		project.setPageNum(getpageNum);
		project.setAmount(getamount);

		int count = projectDao.projectSearchPageCount(project);
		System.out.println("총 검색 건수 : " + count);

		double totalPage1 = (double) count / (double) getamount;
		int totalPage = (int) Math.ceil(totalPage1);

		System.out.println("총 페이지 수 : " + totalPage);

		map.put("projects", projectDao.projectSearchPageList(project));
		map.put("page", getpageNum);
		map.put("totalPage", totalPage);
		map.put("type", gettype);
		map.put("keyword", trimkeyword);
		map.put("amount", getamount);
		
		model.addAttribute("result", map);

		System.out.println("가라");

		return "project/projectSelectList";
	}
	
	@GetMapping("/ajaxMorePage")
	@ResponseBody
	private Map<String, Object> ajaxMorePage(
		@RequestParam("type") String type, 
		@RequestParam("keyword") String keyword,
		@RequestParam("pageNum") int pageNum,
		@RequestParam("amount") int amount,
		ProjectVO project
		){
		Map<String, Object> map = new HashedMap();
		System.out.println("검색 들어오는곳");
		String gettype = type;
		String getkeyword = keyword;
	
		System.out.println("검색 타입 : "+gettype +", 검색어 : "+keyword);
		
		project.setType(gettype);
		project.setKeyword(keyword);
	
		//페이지 처리
		int getpageNum = pageNum; //시작 페이지 번호
		int getamount = amount; //한페이지에 보여줄 건수
		
		
		
		System.out.println("시작 페이지 번호 : "+getpageNum +", 한페이지에 보여줄 건수 : "+getamount);
		
		project.setPageNum(getpageNum);
		project.setAmount(getamount);
		
		int count = projectDao.projectSearchPageCount(project);
		System.out.println("총 검색 건수 : " + count);
		
		double totalPage1 = (double) count /(double) getamount ;
		int totalPage = (int) Math.ceil( totalPage1 );
		
		System.out.println("총 페이지 수 : "+ totalPage );
		
		//더보기 추가
		int rsultPageNum = getpageNum + 1; //시작 페이지 번호 추가
		
		map.put("projects", projectDao.projectSearchPageList(project));
		map.put("page", rsultPageNum);
		map.put("totalPage", totalPage);
		map.put("type", gettype);
		map.put("keyword", getkeyword);
		map.put("amount", getamount);

		System.out.println("가라");
		
		return map;
	}
	
	
	
	@RequestMapping("/projectSelect")
	private String projectSelect(@RequestParam("prj_id") int id, Model model, ProjectVO project) {
		System.out.println("상세페이지");
		project.setPrj_id(id);
		
		model.addAttribute("project",projectDao.projectSelect(project));
		
		return "project/projectSelect";
	}
	
	@RequestMapping("/projectViewDel")
	private String ProjectDelete(ProjectVO project) {
		projectDao.projectView(project);
		
		return "redirect:/projectSearchPage?type=&keyword=&pageNum=1&amount=5";
	}
	
	
	
	@RequestMapping("/projectOfrList")
	private String projectOfrList(Model model) {
		
		return "project/projectOfrList";
	}

	@RequestMapping("/projectAssessList")
	private String projectAssess() {
		return "project/projectAssess";
	}
}
