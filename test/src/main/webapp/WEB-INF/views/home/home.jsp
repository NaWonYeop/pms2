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
							<h2>여기는 메인페이지</h2>
							<p>
								나는원엽이라능~
							</p>
						</div>
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
            <form action="#">
               <div class="form-group">

                  <div class="input-group mb-3">


                     <div class="form-select" id="default-select" style="width: 25%;">
                        <select>
                           <option value=" 1">프로젝트</option>
                           <option value="1">펀딩</option>

                        </select>
                     </div>
                     <input type="text" class="form-control"
                        placeholder='Search Keyword' onfocus="this.placeholder = ''"
                        onblur="this.placeholder = 'Search Keyword'">
                     <div class="input-group-append">
                        <button class="btn" type="submit">
                           <i class="ti-search"></i>
                        </button>
                     </div>
                  </div>
               </div>
              
            </form>
         </aside>
      </div>
   </div>
   <section class="blog_area section_padding">
      <div class="container">
         <div class="row">
            <!--project-->
            <div class="col-lg-6 mb-5 mb-lg-0">
               <div class="row justify-content-center">
                     <div class="section_tittle text-center">

                        <h2>모집중인 프로젝트</h2>
                     </div>
               </div>
               <div class="blog_left_sidebar">
               <c:forEach items="${mainOfer }" var="ofr"> 
                  <article class="blog_item">


                     <div class="blog_details">
                        <a class="d-inline-block" href="single-blog.html"><!-- 여기 주소 -->
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

                        <h2>진행중인 펀딩목록</h2>
                     </div>
               </div>
               <div class="blog_right_sidebar">
                <c:forEach items="${mainFnd }" var="fnd"> 
                  <article class="blog_item">
                     
                

                     <div class="blog_details">
                          <div class="blog_item_img">
                     	<h3 style="font-weight: bold;">${fnd.prj_name }</h3>
                        <img class="card-img rounded-0"
                           src="./resources/upload/images/${fnd.ctf_st_name }" alt="">

                     </div>
                        <a class="d-inline-block" href="single-blog.html"> </a>
                        <h3 class="right"><fmt:formatNumber value="${fnd.total/fnd.prj_gl_prc*100 }" pattern="00"/>%</h3>
                        <div class="progress">
                           <div class="progress-bar color-3" role="progressbar"
                              style="width: <fmt:formatNumber value="${fnd.total/fnd.prj_gl_prc*100 }" pattern="00"/>%;background-color: #1D28F2" aria-valuenow="80" aria-valuemin="0"
                              aria-valuemax="100"></div>
                        </div>
                        <br>
                        <ul class="blog-info-link">
                           <li><i class="far fa-comments"></i> 현재 펀딩금액</li>
                         
                           <li> <h3 stlye="font-weight: bold;"> <div class="single_member_counter"><span class="counter" style="font-size:25px;">${fnd.total }</span>원 </div></h3></li>
                          
                        </ul>
                     </div>
                  </article>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
   </section>
	 <script src="js/jquery.counterup.min.js"></script>
</body>
</html>