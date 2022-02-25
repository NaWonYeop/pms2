package co.test.prj.comtf.service;

import java.util.Date;

import lombok.Data;

@Data
public class comtfVO {
	private int ctf_id;			// app_pk
	private Date ctf_date;		// 프로젝트 생성자
	private int ctf_cid;				// 첨부파일id
	private int ctf_use;			// 사용여부
	
}
