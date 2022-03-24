package co.test.prj.project.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//@Data  //나중에 이걸로 바꿀것 상세내용 때문에 보기 귀찮음
public class ProjectVO
{
	private int prj_id; //pk 일련번호
	private String prj_name; //프로젝트명
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date prj_str; // 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date prj_ed; //마감일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date prj_reg_date; // 등록일 ~디폴트 sysdate로
	private int prj_hit; //조회수 
	private int prj_ofr_prop; // 구인 여부 
	private int prj_fnd_prop; // 펀딩 여부
	private int prj_devEd_prop; // 개발 마감 여부
	private int prj_ver; // 버전
	private String prj_cnt; // 상세내용 
	private int master_id; // fk 담당자 아이디 //우선 널값 해제함
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_ofr_str; //구인 시작일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_ofr_ed; //구인 마감일
	private int prj_frn_prs; //프론트 인원
	private int prj_bk_prs; //백 인원
	private int prj_db_prs; //db 인원
	private int prj_ser_prs; //서버 인원
	private String prj_cnd; //조건
	private String prj_ar; //지역
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_fnd_str; //펀딩 시작일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_fnd_ed; //펀딩 마감일
	private int prj_gl_prc; // 목표금액
	private int prj_view_prop; //글 뷰 여부
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prj_ver_date; //글 수정여부
	
	private int ctf_id;			// app_pk 파일저장 일련번호
	
	//검색필터
	private String type; //검색 타입
	private String keyword; //검색 내용
	
	//페이징
	private int pageNum; //현재 페이지
	private int amount;  //페이지에 보여줄 게시물 수 
	
	private int totalPage; //총 페이지 
	
	private int prj_time; //프로젝트 남은시간
	private String rwd_name; //프로젝트 리워드이름
	
	//원엽
	private int count;//현재참여인원
	private int user_tel;//마스터 전화번호
	private String user_name;//마스터이름
	private int total;//총 구매액
	private String ctf_st_name;//섬네일 저장이름
	private String ctf_usectf_st_course;//저장위치
	private int total_team_prs;//총 구해진 인원
	private int total_prs;//총구하는 인원
	
	//리스트에 뿌릴것들
	private int total_count; //총 신청 인원
	private int total_sum; //총 신청 리워드
	
	//REWARD 내용 추가
	private int reward_id; //리워드 아이디 ,알아서들어감
	private int rwd_prc; //금액
	private String rwd_cnt; //리워드 내용
	
	//BUY 내용추가
	private int buy_id;
	private String buy_way; //구매방법 cash, coin
	private String buy_stt; //상태 보관, 전달, 환불
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date buy_date;
	private int buy_count; //구매수량
	private String buy_muid; //상점 거래ID ~환불시 필요
	
	private int buy_won;
	private long buy_wei;
	
	//환불
	@DateTimeFormat(pattern = "yyyy-MM-dd") //들어갈때
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",  timezone = "GMT+9") //나갈때
	private Date buy_rfnd_date; //환불날짜 
	private int buy_rfnd_won; //환불금액
	private long buy_rfnd_wei; //환불금액
	
	//admin 추가 
	private int admincount;
	
}
