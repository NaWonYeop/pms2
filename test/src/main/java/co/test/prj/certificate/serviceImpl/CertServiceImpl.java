package co.test.prj.certificate.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.test.prj.certificate.service.CertMapper;
import co.test.prj.certificate.service.CertService;
import co.test.prj.certificate.service.CertVO;

@Repository("certDao")
public class CertServiceImpl implements CertService {

	@Autowired
	private CertMapper map;

	@Override
	public List<CertVO> certSelectList() {
		return map.certSelectList();
	}

	@Override
	public CertVO certSelect(CertVO cert) {
		return map.certSelect(cert);
	}

	@Override
	public int certInsert(CertVO cert) {
		return map.certInsert(cert);
	}

	@Override
	public int certUpdate(CertVO cert) {
		return map.certUpdate(cert);
	}

	@Override
	public int certDelete(CertVO cert) {
		return map.certDelete(cert);
	}
	
	
}
