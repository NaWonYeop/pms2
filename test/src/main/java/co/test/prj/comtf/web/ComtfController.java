package co.test.prj.comtf.web;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class ComtfController {
	
	
	//상세내용 이미지 임시등록
	@ResponseBody
	@PostMapping("/upload/image")
	public Map<String, Object> uploadImage(@RequestParam Map<String, Object> paramMap, MultipartRequest request, HttpServletRequest hreq) throws Exception
	{
		
		System.out.println("이미지들어오냐?");
		MultipartFile uploadFile = request.getFile("upload");
		System.out.println("uploadFile : "+uploadFile);
		
		//Path currentPath = Paths.get(""); 
		
		//나중에 경로 realpath 바꿔야함
		String path = hreq.getServletContext().getRealPath("resources\\upload"); 
		//String path = "C:\\Users\\admin\\git\\pms2\\test\\src\\main\\webapp\\resources\\upload";
		String path2 = path.replace("\\", "/");
		System.out.println("path2 : "+ path2);
		String uploadDir = path2 + "/images/";
		System.out.println("uploadDir : "+ uploadDir);
		String uploadId = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		System.out.println("uploadId : "+uploadId);
		//파일 저장
		uploadFile.transferTo(new File(uploadDir + uploadId));
		System.out.println("uploadFile : "+uploadFile);
		//경로~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		paramMap.put("url", "./resources/upload/images/"+uploadId);
		//paramMap.put("url", "/upload/images/" + uploadId);
		return paramMap;
	}

}
