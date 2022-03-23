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
  top: 20px;
  font-size: 23px;
  font-family: "FontAwesome";
  color: #fff;
}
.timeline-article .content-left:before {
  content: "\f0da";
  right: -8px;
}
.timeline-article .content-right:before {
  content: "\f0d9";
  left: -8px;
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
@media only screen and (max-width: 400px) {
  .timeline-article p {
    margin: 0;
  }
  .timeline-article p span.article-number {
    display: none;
  }
  
}
/*===== // Resonsive Vertical Timeline =====*/
	
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
   
   <!-- 가이드 시작 -->
  <div class="container" style="margin-top: 5%;">
	<div class="row">
		<div class="col-lg-3" style="">
			<div class="info" style="float: right; margin-top: 150px;">
				<h1 style="font-size: 30px; float: right">How to use?</h1>
				<h1 style="font-size: 60px; float: right; color: #F27457">프로젝트</h1><br>
				<h1 style="font-size: 80px; float: right">시<br>작<br>하<br>기</h1>
			</div>
		</div>
  		<div class="col-lg-9" style="background-color: #F5F7FF; border-radius: 20px;">
  <section id="conference-timeline" style="margin-top: 3%; margin-bottom: 3%;">
    <div class="timeline-start">Start</div>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!--------------------------------- 프로젝트 ----------------------------------->
      <!-- Article -->
      <div class="timeline-article">

        <!-- 왼쪽 -->
        <div class="content-left-container">
          <div class="content-left" style="background-color: bluesky;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number" style="line-height: 30px; top: -5px;">프로<br>젝트</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div>

        <!-- 오른쪽 -->
        <!-- <div class="content-right-container">
          <div class="content-right" style="background-color: bluesky;">
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
      <!--------------------------------- 프로젝트끝 ----------------------------------->
      
      <!--------------------------------- 구직 ----------------------------------->
      <!-- Article -->
      <div class="timeline-article">

        <!-- 왼쪽 -->
        <!-- <div class="content-left-container">
          <div class="content-left" style="background-color: bluesky;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number">구직</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> -->

        <!-- 오른쪽 -->
        <div class="content-right-container">
          <div class="content-right" style="background-color: bluesky;">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. <span class="article-number">구직</span></p>
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
          <div class="content-left" style="background-color: bluesky;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number">구인</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> 

        <!-- 오른쪽 -->
        <!-- <div class="content-right-container">
          <div class="content-right" style="background-color: bluesky;">
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
          <div class="content-left" style="background-color: bluesky;">
            <p>구직에 대해 설명을 적을까 방법을 적을까 고민이네<span class="article-number">펀딩</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div> -->

        <!-- 오른쪽 -->
        <div class="content-right-container">
          <div class="content-right" style="background-color: bluesky;">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. <span class="article-number">펀딩</span></p>
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
   <!-- 가이드 끝 -->
   
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


                     <div class="blog_details">
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
                     
                

                     <div class="blog_details">
                          <div class="blog_item_img">
                     	<h3 style="font-weight: bold;">${fnd.prj_name }</h3>
                        <a class="d-inline-block" href="projectSelect?prj_id=${fnd.prj_id }">
                        <img class="card-img rounded-0"
                           src="./resources/upload/images/${fnd.ctf_st_name }" alt="">
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