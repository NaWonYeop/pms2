package co.test.prj.pms;

import java.util.Date;

import lombok.Data;

@Data
public class ListVO {
	private String list_name;			// 소분류이름 
	private String sec_name;			// 중분류이름
	private String user_id;				// 회원 일련번호
	private String prj_id;					// 프로젝트 일련번호
	private Date list_start;				// 프로젝트 시작일
	private Date list_end;				// 프로젝트 마감일
	private boolean list_chk;			// 완료여부
}
