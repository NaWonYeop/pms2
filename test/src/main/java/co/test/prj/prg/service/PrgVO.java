package co.test.prj.prg.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PrgVO {
	private int level;
	private int prg_id;
	private int master_id;
	private int prj_id;
	
	private String prg_content;	// 내용
	private String prg_manager;		// 섹션, 할일 구분
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prg_str;			// 시작날짜
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prg_ed;				// 종료날짜
	private int prg_user;				// 담당자
	private int prg_cmp_prop;		// 완료여부 0:진행 , 1:완료
}
