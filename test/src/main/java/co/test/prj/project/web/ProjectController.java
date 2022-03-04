package co.test.prj.project.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import co.test.prj.user.service.UserService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectDao;
	
	@Autowired
	private ComtfService comtfDao;
	
	@Autowired
	private UserService userDao;
	
	@RequestMapping("/projectInsertForm")
	public String main() {
		return "project/projectInsertForm";
	}
	
	@PostMapping("/projectInsert")
	public String projectInsert (
			@RequestParam("mul") MultipartFile multi, 
			ProjectVO project, ComtfVO comtf, 
			HttpSession session, 
			HttpServletRequest hreq) {
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
			
			//나중에 전체목록 만들면 그곳으로 경로 변경할것
			return "redirect:/projectInsertForm";
		} else {
			System.out.println("펀딩하면");
			
			//session 말고 다른방법은????? RedirectAttributes ~ addFlashAttribute 제외
			
			session.setAttribute("sessionMId", project.getMaster_id());
			session.setAttribute("sessionPId", pId);
			
			System.out.println("session등록 ~ sessionMId : "+ project.getMaster_id()+", sessionPId : "+ pId);
			
			return "redirect:/rewardInsertForm";
		}
		
		
	}
	
	//우선 검색창 연습으로 만드는곳
	@RequestMapping("/project")
	private String project(Model model) {
		
		return "project/project";
	}
	
	@GetMapping("/projectSerchList")
	@ResponseBody
	private List<ProjectVO> projectSerchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword, ProjectVO project){
		System.out.println("검색 들어오는곳");
		String gettype = type;
		
		String getkeyword = keyword;
		//키워드 받은값 앞뒤 공백 지워주기~~~~~~~~~~~~~~~~~~~~~~~~
		
		System.out.println("type : "+gettype +", keyword : "+getkeyword);
		project.setType(gettype);
		project.setKeyword(getkeyword);
		
		projectDao.projectSearchList(project);
		
		return null;
	}
	
	@GetMapping("/projectSerchList2")
	@ResponseBody
	private List<ProjectVO> projectSerchList2(
			@RequestParam("type") String type, 
			@RequestParam("keyword") String keyword,
			@RequestParam("pageNum") int pageNum,
			@RequestParam("amount") int amount,
			ProjectVO project){
		System.out.println("검색 들어오는곳");
		String gettype = type;
		String getkeyword = keyword;
		//키워드 받은값 앞뒤 공백 지워주기~~~~~~~~~~~~~~~~~~~~~~~~

		System.out.println("type : "+gettype +", keyword : "+getkeyword);
		
		project.setType(gettype);
		project.setKeyword(getkeyword);

		//페이지 처리
		int getpageNum = pageNum;
		int getamount = amount;
		
		System.out.println("pageNum : "+getpageNum +", amount : "+getamount);
		
		project.setPageNum(getpageNum);
		project.setAmount(getamount);
		
		//projectDao.projectSearchList(project);
		projectDao.projectSearchPageList(project);
		
		return null;
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
