package co.test.prj.comtf.service;


import lombok.Data;

@Data
public class comtfVO {
	private int ctf_id;			// app_pk
	private String ctf_st_name;		// 저장파일명
	private String ctf_oru_name;				// 원파일명
	private String ctf_usectf_st_course;			// 파일저장경로
}
