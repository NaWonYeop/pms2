package co.test.prj.certificate.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import co.test.prj.certificate.service.CertService;
import co.test.prj.certificate.service.CertVO;

@RestController
public class CertController {
	
	@Autowired CertService certDao;
	
	@GetMapping("/certSelect")
	public List<CertVO> certSelectList(CertVO cert){
		return certDao.certSelectList();
	}
	
	@GetMapping("certInsert")
	public CertVO certInsert(CertVO cert) {
		certDao.certInsert(cert);
		return cert;
	}
	@GetMapping("certUpdate")
	public CertVO certUpdate(CertVO cert) {
		certDao.certUpdate(cert);
		return cert;
		
	}
	@GetMapping("certDelete")
	public CertVO certDelete(CertVO cert) {
		certDao.certDelete(cert);
		return cert;
	}
	
}
