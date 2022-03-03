package co.test.prj.certificate.service;

import java.util.List;

public interface CertMapper {
	List<CertVO> certSelectList();
	List<CertVO> certSelect(CertVO cert);
	int certInsert(CertVO cert);
	int certUpdate(CertVO cert);
	int certDelete(CertVO cert);
}
