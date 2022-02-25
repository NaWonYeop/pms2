package co.test.prj.certificate.service;

import java.util.Date;

import lombok.Data;

@Data
public class CertVO {
	private int cert_id;
	private int user_id;
	private String cert_name;
	private Date cert_acq_date;
}
