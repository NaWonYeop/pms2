package co.test.prj.project.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.test.prj.project.service.ProjectService;
import co.test.prj.project.service.ProjectVO;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectDao;
	
	//중복사용 어떻게 하냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//@Autowired
	//private ComtfService comtfDao;
	
	@RequestMapping("/projectInsertForm")
	public String main() {
		return "project/projectInsertForm";
	}
	
	@PostMapping("/projectInsert")
	public String projectInsert (@RequestParam("mul") MultipartFile multi, ProjectVO project, HttpSession session, HttpServletRequest hreq) {
		System.out.println("인서트 되냐?");
		
		//멀티파트 사진 들어올때
		int fNum = projectDao.comtfCountMax(); //파일 번호 CTF_ID
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
			project.setCtf_oru_name(oriThuName);
			project.setCtf_st_name(savThuName);
			project.setCtf_usectf_st_course(uploadDir);
			
			
			projectDao.comtfInsert(project);
			try {
				multi.transferTo(new File(uploadDir, savThuName));
			} catch (Exception e) {
				System.out.println("이미지 저장시 오류생김");
				e.printStackTrace();
			} 
		
		} else {
			System.out.println("사진없냐?");
		}
		
		projectDao.projectInsert(project);
		
		System.out.println(project.getPrj_name());
		
		return "project/projectInsertForm";
	}

}
