<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<html>
<style>
	.blog_item {
		background-color: #F5F7FF;
	}
	
	.btn_4 {
		background-color: #798BF2;
	}
	
	.breadcrumb_bg {
		background-color: #576EF2;
	}
	
	li {
		font-family: 'TmoneyRoundWindRegular';
	}
	
	.mainText {
		color: #fff;
  text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #798BF2,
    0 0 10px #798BF2, 0 0 10px #798BF2, 0 0 10px #798BF2, 0 0 10px #798BF2;
	}
	
	

/*===== Vertical Timeline =====*/
#conference-timeline {
  position: relative;
  max-width: 920px;
  width: 100%;
  margin: 0 auto;
}
#conference-timeline .timeline-start,
#conference-timeline .timeline-end {
  border-radius: 50px;
  display: table;
  font-family: "Roboto", sans-serif;
  font-size: 18px;
  font-weight: 900;
  text-transform: uppercase;
  background: #F27457;
  padding: 15px 23px;
  color: #fff;
  max-width: 5%;
  width: 100%;
  text-align: center;
  margin: 0 auto;
}
#conference-timeline .conference-center-line {
  position: absolute;
  width: 3px;
  height: 100%;
  top: 0;
  left: 50%;
  margin-left: -2px;
  background: #F27457;
  z-index: -1;
}
#conference-timeline .conference-timeline-content {
  padding-top: 67px;
  padding-bottom: 67px;
}
.timeline-article {
  width: 100%;
  height: 100%;
  position: relative;
  overflow: hidden;
  margin: 20px 0;
}
.timeline-article .content-left-container,
.timeline-article .content-right-container {
  max-width: 44%;
  width: 100%;
}
.timeline-article .timeline-author {
  display: block;
  font-weight: 400;
  font-size: 14px;
  line-height: 24px;
  color: #242424;
  text-align: right;
}
.timeline-article .content-left,
.timeline-article .content-right {
  position: relative;
  width: auto;
  border: 1px solid #ddd;
  border-radius: 15px;
  box-shadow: 0 1px 3px rgba(0,0,0,.03);
  padding: 27px 25px;
}
.timeline-article p {
  margin: 0 0 0 60px;
  padding: 0;
  font-weight: 400;
  color: #242424;
  font-size: 14px;
  line-height: 24px;
  position: relative;
}
.timeline-article p span.article-number {
  position: absolute;
  font-weight: 300;
  font-size: 28px;
  top: 10px;
  left: -60px;
  color: #F27457;
}
.timeline-article .content-left-container {
  float: left;
}
.timeline-article .content-right-container {
  float: right;
}
.timeline-article .content-left:before,
.timeline-article .content-right:before{
  position: absolute;
  top: 7px;
  font-size: 23px;
  font-family: "FontAwesome";
  color: #fff;
  z-index: -1;
}

.timeline-article .content-left:before {
  content: url("resources/main/img/direction.png");
  right: -13px;
}

.timeline-article .content-right:before {
  content: url("resources/main/img/direction.png");
  left: -13px;
}

.timeline-article .meta-date {
  position: absolute;
  top: 0;
  left: 50%;
  width: 62px;
  height: 62px;
  margin-left: -31px;
  color: #fff;
  border-radius: 100%;
  background: #F27457;
}
.timeline-article .meta-date .date,
.timeline-article .meta-date .month {
  display: block;
  text-align: center;
  font-weight: 900;
}
.timeline-article .meta-date .date {
  font-size: 30px;
  line-height: 40px;
}
.timeline-article .meta-date .month {
  font-size: 18px;
  line-height: 10px;
}
/*===== // Vertical Timeline =====*/

/*===== Resonsive Vertical Timeline =====*/
@media only screen and (max-width: 830px) {
  #conference-timeline .timeline-start,
  #conference-timeline .timeline-end {
    margin: 0;
  }
  #conference-timeline .conference-center-line {
    margin-left: 0;
    left: 50px;
  }
  .timeline-article .meta-date {
    margin-left: 0;
    left: 20px;
  }
  .timeline-article .content-left-container,
  .timeline-article .content-right-container {
    max-width: 100%;
    width: auto;
    float: none;
    margin-left: 110px;
    min-height: 53px;
  }
  .timeline-article .content-left-container {
    margin-bottom: 20px;
  }
  .timeline-article .content-left,
  .timeline-article .content-right {
    padding: 10px 25px;
    min-height: 65px;
  }
  .timeline-article .content-left:before {
    content: "\f0d9";
    right: auto;
    left: -8px;
  }
  .timeline-article .content-right:before {
    display: none;
  }
}

.direction {
	position: absolute;
}
@media only screen and (max-width: 400px) {
  .timeline-article p {
    margin: 0;
  }
  .timeline-article p span.article-number {
    display: none;
  }
  
}
/*===== // Resonsive Vertical Timeline =====*/

/* PMS 가이드 시작 */
/* General code */
@import url(https://fonts.googleapis.com/css?family=Barlow+Condensed);
body {
  font-family: "Barlow Condensed";
  margin: auto;
  width: 100%;
  justify-content: center;
  display: flex;
  flex-direction: column;
  text-align: center;
  font-size: 16px;
}
button {
  width: 100px;
  margin: auto;
}
.timeline {
  display: flex;
  margin: auto;
  justify-content: center;
}
.timeline .circle {
  width: 77px;
  height: 35px;
  border-radius: 30px;
  background-color: #F27457;
  margin: 0;
  padding: 2px;
  margin-left: -5px;
  z-index: 2;
  position: relative;
}
.timeline .circle:hover {
  cursor: pointer;
}
.timeline .circle p {
  text-align: center;
  margin: auto;
  line-height: 30px;
  color: #ffffff;
}
.timeline .link {
  z-index: 0;
  background-color: #F27457;
  padding: 0;
}
.square {
  max-width: 250px;
  min-width: 100px;
  height: 115px;
  border-radius: 10px;
  background-color: #fff;
  z-index: 2;
  position: relative;
}
.square.blank {
  visibility: hidden;
}
#end {
  width: 0;
  height: 0;
}
.square h3,
.square h4 {
  margin: 0px 0px 0px 15px;
  text-align: left;
  font-size: 16px;
}
.square h3 {
  padding-top: 10px;
}
.square h4 {
  font-style: italic;
  font-weight: normal;
}

/* Linear timeline from left to right */
#horizontal-timeline {
  flex-direction: row;
  min-width: 1100px;
}
.horizontal .link {
  width: auto;
  height: 5px;
  margin-top: -15px;
  margin-left: 5px;
}
.horizontal .square {
  margin: 30px 0 20px -30px;
}
.horizontal .square p {
  padding: 0;
  margin: 0;
  width: 100%;
}
.square.up::after {
  margin: 5px 0px 0px 42px;
  border-left: 20px solid transparent;
  border-right: 20px solid transparent;
  border-top: 20px solid #798BF2;
}

.square.down::after {
  margin: -119px 0 15px 42px;
  border-left: 20px solid transparent;
  border-right: 20px solid transparent;
  border-bottom: 20px solid #798BF2;
}
.horizontal #end {
  margin: 177px 0;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
  border-left: 10px solid #F27457;
}

/* Linear timeline from top to bottom */
.vertical .block {
  display: flex;
  flex-direction: row;
}
#vertical-timeline {
  flex-direction: column;
}
.vertical .link {
  width: 5px;
  height: 150px;
  margin-top: 0;
  margin-left: -20px;
}
.vertical .square {
  width: 250px;
  margin: 0px 25px 0px 35px;
}
.vertical .square p {
  padding: 0;
  margin: 0;
}
.vertical #end {
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-top: 10px solid #a8d0f7;
  margin: auto;
  margin-left: 311px;
}
.square::after {
  content: " ";
  display: block;
  z-index: 0;
  width: 0px;
  height: 0px;
}
.square.left::after {
  margin: -70px 11px 0px -15px;
  border-top: 20px solid transparent;
  border-bottom: 20px solid transparent;
  border-right: 20px solid rgb(176, 179, 204);
}
.square.right::after {
  margin: -75px 0px 0px 242px;
  border-top: 20px solid transparent;
  border-bottom: 20px solid transparent;
  border-left: 20px solid rgb(176, 179, 204);
}
/* PMS 가이드 끝 */
</style>

<body>
   <!--::header part start::-->

   <!-- Header part end-->

   <!-- breadcrumb start-->
   <section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">I AM ONEYEOP</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">KEROKERORI~</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
   <!-- breadcrumb start-->


   <!--================Blog Area =================-->
   <br>
   <br>

   <!-- ===============검색창====================-->
   <div class="row justify-content-center">
      <div class="col-sm-7">
         <aside class="single_sidebar_widget search_widget">
            <form action="projectSearchPage">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type">
									<option value="fnd">펀딩</option>
									<option value="ofr">구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control"
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">

								<button class="btn" type="submit" style="padding: 0">
									<img alt="search" src="resources/main/img/search.png"
										height="37px">

								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> <input
						type="hidden" name="amount" value="5">
				</form>
         </aside>
      </div>
   </div>
   <!-- 검색끝 -->
   
   <!-- 프로젝트 가이드 시작 -->
  <div class="container" style="margin-top: 5%;">
	<div class="row">
		<div class="col-lg-3" style="">
			<div class="info" style="float: right;">
				<h1 style="font-size: 30px; float: right">How to use?</h1>
				<h1 style="font-size: 60px; float: right; color: #F27457">프로젝트</h1><br>
				<h1 style="font-size: 80px; float: right">시<br>작<br>하<br>기</h1>
			</div>
		</div>
  		<div class="col-lg-9" style="background-color: #F5F7FF; border-radius: 20px; z-index: -1;">
  <section id="conference-timeline" style="margin-top: 3%; margin-bottom: 3%;">
    <div class="timeline-start">Start</div>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!--------------------------------- 프로젝트 ----------------------------------->
      <!-- Article -->
      <div class="timeline-article">

        <!-- 왼쪽 -->
        <div class="content-left-container">
          <div class="content-left" style="background-color: #fff;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number" style="line-height: 30px; top: -5px; font-weight: bold;">생성</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div>

        <!-- 오른쪽 -->
        <!-- <div class="content-right-container">
          <div class="content-right" style="background-color: #fff;">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. <span class="article-number" style="line-height: 30px; top: -5px;">프로<br>젝트</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div>  -->
        
        <!-- 센터 -->
        <div class="meta-date">
          <span class="date" style="font-size: small;">Step</span>
          <span class="month">1</span>
        </div>
      </div>
      <!-- // Article -->
      <!--------------------------------- 프로젝트 끝 ----------------------------------->
      
      <!--------------------------------- 구직 ----------------------------------->
      <!-- Article -->
      <div class="timeline-article">

        <!-- 왼쪽 -->
        <!-- <div class="content-left-container">
          <div class="content-left" style="background-color: #fff;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number">구직</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> -->

        <!-- 오른쪽 -->
        <div class="content-right-container">
          <div class="content-right" style="background-color: #fff;">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. <span class="article-number" style=" font-weight: bold;">구직</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> 
        
        <!-- 센터 -->
        <div class="meta-date">
          <span class="date" style="font-size: small;">Step</span>
          <span class="month">2</span>
        </div>
      </div>
      <!-- // Article -->
      <!--------------------------------- 구직끝 ----------------------------------->
      
      <!--------------------------------- 구인 ----------------------------------->
      <!-- Article -->
      <div class="timeline-article">

        <!-- 왼쪽 -->
        <div class="content-left-container">
          <div class="content-left" style="background-color: #fff;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number" style=" font-weight: bold;">구인</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> 

        <!-- 오른쪽 -->
        <!-- <div class="content-right-container">
          <div class="content-right" style="background-color: #fff;">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. <span class="article-number">구인</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> -->
        
        <!-- 센터 -->
        <div class="meta-date">
          <span class="date" style="font-size: small;">Step</span>
          <span class="month">3</span>
        </div>
      </div>
      <!-- // Article -->
      <!--------------------------------- 구인끝 ----------------------------------->
      
      <!--------------------------------- 펀딩 ----------------------------------->
      <!-- Article -->
      <div class="timeline-article">

        <!-- 왼쪽 -->
       <!--  <div class="content-left-container">
          <div class="content-left" style="background-color: #fff;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number">펀딩</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> -->

        <!-- 오른쪽 -->
        <div class="content-right-container" style="">
          <div class="content-right" style="background-color: #fff;">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. <span class="article-number" style=" font-weight: bold;">펀딩</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> 
        
        <!-- 센터 -->
        <div class="meta-date">
          <span class="date" style="font-size: small;">Step</span>
          <span class="month">4</span>
        </div>
      </div>
      <!-- // Article -->
      <!--------------------------------- 펀딩끝 ----------------------------------->
      
    </div>
    <div class="timeline-end">End</div>
  </section>
  </div>
  </div>
  </div>
  <!--------------------------------- 프로젝트 가이드 끝 ----------------------------------->
	<!-- <img alt="" src="resources/main/img/myproject.png"> -->
<!-- breadcrumb start-->
   <section class="breadcrumb2 breadcrumb_bg2">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					
				</div>
			</div>
		</div>
	</section>
   <!-- breadcrumb start-->
   <!--------------------------------- PMS 시작 끝 ----------------------------------->
   <div class="container" style="margin-top: 5%; background-color: #F5F7FF; border-radius: 10px;">
	<div class="row" style="margin-top: 25px;">
		
      <h1 style="color: #F27457; margin-left: 8%">P</h1><h1>ROJECT</h1>&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="color: #F27457;">M</h1><h1>ANAGEMENT</h1>&nbsp;&nbsp;&nbsp;&nbsp; <h1 style="color: #F27457;">S</h1><h1>UPPORT</h1>
      </div>
<div id="horizontal-timeline" class="timeline horizontal reverse">
  <div class="block">
    <div class="square up" style="">
      <div class="area" style="width:250px; height: 105px;">
	      <h3>팀 선택하기</h3>
	      <p style="margin-bottom: 5px;">가나다마바사 아자차카 타파하 ABCDEFG HI JKLMN OPQ RSTUVW XYZ 글자수의 맥스는 여기</p>
      </div>
    </div>
    <div class="circle">
      <p>Step 1</p>
    </div>
    <div class="link"></div>
    <div class="square down blank"></div>
  </div>
  <div class="block">
    <div class="square up blank"></div>
    <div class="circle activated">
      <p>Step 2</p>
    </div>
    <div class="link"></div>
    <div class="square down">
      <div class="area" style="width:250px; height: 105px;">
	      <h3>신청멤버 확인</h3>
	      <p style="margin-bottom: 5px;">sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      </div>
    </div>
  </div>
  <div class="block">
    <div class="square up">
      <div class="area" style="width:250px; height: 105px;">
      <h3>일정관리</h3>
      <p style="margin-bottom: 5px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
      </div>
    </div>
    <div class="circle">
      <p>Step 3</p>
    </div>
    <div class="link"></div>
    <div class="square down blank"></div>
  </div>
  <div class="block">
    <div class="square up blank"></div>
    <div class="circle">
      <p>Step 4</p>
    </div>
    <div class="link"></div>
    <div class="square down">
      <div class="area" style="width:250px; height: 105px;">
      <h3>TO DO LIST</h3>
      <p style="margin-bottom: 5px;">elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      </div>
    </div>
  </div>

  <!-- <div class="block">
    <div class="square up">
      <h3>Main title</h3>
      <h4>date</h4>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div class="circle">
      <p>STEP 5</p>
    </div>
    <div class="link"></div>
    <div class="square down blank"></div>
  </div> -->
  <div id="end"></div>
</div>
</div>

      <!--------------------------------- PMS 가이드 끝 ----------------------------------->
   <section class="blog_area section_padding" style="margin-top: 7%;">
      <div class="container">
         <div class="row">
            <!--project-->
            <div class="col-lg-6 mb-5 mb-lg-0">
               <div class="row justify-content-center">
                     <div class="section_tittle text-center">

                        <h2 class="mainText">모집중인 프로젝트${SPRING_SECURITY_CONTEXT }</h2>
                     </div>
               </div>
               <div class="blog_left_sidebar">
               <c:forEach items="${mainOfer }" var="ofr"> 
                  <article class="blog_item">


                     <div class="blog_details" style="text-align: left;">
                        <a class="d-inline-block" href="projectSelect?prj_id=${ofr.prj_id }"><!-- 여기 주소 -->
                           <h2>${ofr.prj_name }</h2>
                        </a> <br>
                        <c:if test="${!empty ofr.prj_ar }"><p class="btn_4">${ofr.prj_ar }</p></c:if>
                        <c:if test="${!empty ofr.prj_cnd }"><p class="btn_4">${ofr.prj_cnd }</p></c:if>
                          

                        <ul class="blog-info-link">
                           <li><i class="far fa-user"></i> 모집인원 ${ofr.total_team_prs }/${ofr.total_prs }명</a></li>
                           <li><i class="far fa-comments"></i> 기간
                              <fmt:formatDate value="${ofr.prj_ofr_str }"
									pattern="yyyy-MM-dd" />~<fmt:formatDate value="${ofr.prj_ofr_ed}"
									pattern="yyyy-MM-dd" /></a></li>
                        </ul>
                     </div>
                  </article>
                  </c:forEach>
               </div>
            </div>



            <!--  funding-->
            <div class="col-lg-6 mb-5 mb-lg-0">
               <div class="row justify-content-center">
                     <div class="section_tittle text-center">

                        <h2 class="mainText">진행중인 펀딩목록</h2>
                     </div>
               </div>
               <div class="blog_right_sidebar">
                <c:forEach items="${mainFnd }" var="fnd"> 
                  <article class="blog_item">
                     
                

                     <div class="blog_details" style="text-align: left;">
                          <div class="blog_item_img">
                     	<h3 style="font-weight: bold;">${fnd.prj_name }</h3>
                        <a class="d-inline-block" href="projectSelect?prj_id=${fnd.prj_id }">
                        <img class="card-img rounded-0"
                           src="images/${fnd.ctf_st_name }" alt="">
						</a>
                     </div>
                         
                        <h3 class="right"><fmt:formatNumber value="${fnd.total/(fnd.prj_gl_prc*1000)*100 }" pattern="00"/>%</h3>
                        <div class="progress">
                           <div class="progress-bar color-3" role="progressbar"
                              style="width: <fmt:formatNumber value="${fnd.total/(fnd.prj_gl_prc*1000)*100 }" pattern="00"/>%;background-color: #1D28F2" aria-valuenow="80" aria-valuemin="0"
                              aria-valuemax="100"></div>
                        </div>
                        <br>
                        <ul class="blog-info-link">
                           <li><i class="far fa-comments"></i> 현재 펀딩금액</li>
                         
                           <li> <h3 stlye="font-weight: bold;"> <div class="single_member_counter"><span class="counter" style="font-size:25px;">${Integer.parseInt(String.valueOf(Math.round(fnd.total/10)))},0</span>원 </div></h3></li>
                          
                        </ul>
                     </div>
                  </article>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
   </section>
	 <script src="resources/main/js/jquery.counterup.min.js"></script>
<script src="resources/main/js/custom.js"></script>
	 <script type="text/javascript">
	 toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": true,
			  "positionClass": "toast-top-right",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "100",
			  "hideDuration": "1000",
			  "timeOut": "1500",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}    
	 
	 </script>
</body>
</html>