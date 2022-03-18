package co.test.prj.report.service;

import java.util.Date;

import lombok.Data;
@Data
public class ReportVO {
	private String report_id;
	private String user_id;
	private String prj_id;
	private Date rpr_reg_date;
	private String rpr_cnt;
	private String rpr_prg_rt;
	private String ctf_id;
	
}
