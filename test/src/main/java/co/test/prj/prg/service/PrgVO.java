package co.test.prj.prg.service;

import java.util.Date;

import lombok.Data;

@Data
public class PrgVO {
	private int prg_id;						// 글 일련번호(pk)

	private int user_id;					// 업무 주는 사람
	private int prj_id;						// 프로젝트 번호
	
	private String prg_ttl;				// 제목
	private int prg_clsfc;					// 중, 소 구분(null값의 경우 중분류)
	private Date prg_str;					// 시작일
	private Date prg_ed;					// 마감일
	private int prg_chr;					// 업무 맡을 사람
	private char prg_cmp_prop;		// 완료여부 
	private String prg_dept;			// 부서이름(프론트,백엔드)
}
