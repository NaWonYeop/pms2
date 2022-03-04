<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>

<body>
   <!--::header part start::-->

   <!-- Header part end-->

   <!-- breadcrumb start-->
   <section class="breadcrumb  col-xs-6">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner text-center">
                  <div class="breadcrumb_iner_item">
                     <h2></h2>

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
                  <div class="col-xl-5">
                     <div class="section_tittle text-center">

                        <h2>모집중인 프로젝트</h2>
                     </div>
                  </div>
               </div>
               <div class="blog_left_sidebar">
                  <article class="blog_item">


                     <div class="blog_details">
                        <a class="d-inline-block" href="single-blog.html">
                           <h2>푸로젝트 제목</h2>
                        </a> <br>
                        <p class="btn_4">hi</p>
                        <p class="btn_4">bye</p>
                        <p class="btn_4">boy</p>

                        <ul class="blog-info-link">
                           <li><i class="far fa-user"></i> 모집인원 1/3명</a></li>
                           <li><i class="far fa-comments"></i> 기간
                              2022/02/14~2022/03/14</a></li>
                        </ul>
                     </div>
                  </article>
               </div>
            </div>



            <!--  funding-->
            <div class="col-lg-6 mb-5 mb-lg-0">
               <div class="row justify-content-center">
                  <div class="col-xl-5">
                     <div class="section_tittle text-center">

                        <h2>진행중인 펀딩목록</h2>
                     </div>
                  </div>
               </div>
               <div class="blog_right_sidebar">
                  <article class="blog_item">
                     
                

                     <div class="blog_details">
                          <div class="blog_item_img">
                     	<h3 style="font-weight: bold;">펀딩 제목</h3>
                        <img class="card-img rounded-0"
                           src="resources/main/img/blog/single_blog_1.png" alt="">

                     </div>
                        <a class="d-inline-block" href="single-blog.html"> </a>
                        <h3 class="right">80%</h3>
                        <div class="progress">
                           <div class="progress-bar color-3" role="progressbar"
                              style="width: 80%;background-color: #f09359" aria-valuenow="80" aria-valuemin="0"
                              aria-valuemax="100"></div>
                        </div>
                        <br>
                        <ul class="blog-info-link">
                           <li><i class="far fa-comments"></i> 현재 펀딩금액</a></li>
                         
                           <li> <h3 stlye="font-weight: bold;"> <div class="single_member_counter"><span class="counter" style="font-size:25px;">100,00025</span>원 </div></h3></li>
                          
                        </ul>
                     </div>
                  </article>
               </div>
            </div>
         </div>
      </div>
   </section>

</body>
</html>