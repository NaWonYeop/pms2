package co.test.prj.project.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProjectVO
{
	private int prj_id; //pk 일련번호
	private String prj_name; //프로젝트명
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_str; // 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_ed; //마감일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_reg_date; // 등록일 ~디폴트 sysdate로
	private int prj_hit; //조회수 
	private int prj_ofr_prop; // 구인 여부 
	private int prj_fnd_prop; // 펀딩 여부
	private int prj_devEd_prop; // 개발 마감 여부
	private int prj_ver; // 버전
	private String prj_cnt; // 상세내용 
	private int master_id; // fk 담당자 아이디 //우선 널값 해제함
	//private int ctf_id; //첨부파일 일련번호 펀딩사진//우선 널값 해제함
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_ofr_str; //구인 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_ofr_ed; //구인 마감일
	private int prj_frn_prs; //프론트 인원
	private int prj_bk_prs; //백 인원
	private int prj_db_prs; //db 인원
	private int prj_ser_prs; //서버 인원
	private String prj_cnd; //조건
	private String prj_ar; //지역
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_fnd_str; //펀딩 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_fnd_ed; //펀딩 마감일
	private int prj_gl_prc; // 목표금액
	
	private int ctf_id;			// app_pk 파일저장 일련번호
	
	//검색필터
	private String type; //검색 타입
	private String keyword; //검색 내용
	
	//페이징
	private int pageNum; //현재 페이지
	private int amount;  //페이지에 보여줄 게시물 수 
	
	private int strPage; //시작 페이지
	private int endPage; //마지막 페이지
	private int totalCount; //총 건수 
	
	private int prj_time; //프로젝트 남은시간
	private String rwd_name; //프로젝트 리워드이름
}
