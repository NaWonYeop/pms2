<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@font-face {
	font-family: 'MinSans-Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Medium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<title>Insert title here</title>
</head>
<body>
    <!-- 검은블록-->
    <section class="breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner text-center">

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- ================ 바디부분 ================= -->
    <section class="contact-section section_padding">
        <div class="container">



            <div class="row">
                <div class="col-12">
                    <h2 class="contact-title ">내 펀딩 리스트</h2>
                </div>
           <c:choose>
					<c:when test="${empty funding}">
						<p style="font-family: 'MinSans-Medium'; position: relative; left: 15px;">구매한 펀딩이 없습니다</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ funding}" var="fun">
							<div class="blog_details col-4" style="display: inline-block;">
								<div class="blog_item_img">

									<img class="card-img rounded-0"
										src="./resources/upload/images/${fun.ctf_st_name }" alt="">

								</div>
								<a class="d-inline-block" href="single-blog.html"> <br>
									<h3 style="font-weight: bold; font-family: 'MinSans-Medium';">${fun.prj_name }</h3>


								</a> <br>
								<div class="col-lg-9"
									style="display: inline-block; padding-left: 0px;">
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											style="width: ${fun.total/fun.prj_gl_prc*100 }%;background-color: #009231"
											aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
								<div class="col-lg-2" style="display: inline-block;">

									<h3>
										<fmt:formatNumber value="${fun.total/fun.prj_gl_prc*100 }"
											pattern="00" />
										%
									</h3>
								</div>

								<br>
								<ul class="blog-info-link">
									<li><i class="far fa-comments"></i> 현재 펀딩금액</a></li>
									<li>
										<h3 stlye="font-weight: bold;">
											<span class="counter" style="font-size: 20px;">${fun.total }</span>
											원
										</h3>
									</li>

								</ul>
								<div class="col-sm-12 text-center" style="padding-left: 0px;">
									<button type="button" class="button button-contactForm btn_1"
										style="width: 100%; font-family: 'MinSans-Medium';">환불</button>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

            </div>
        </div>
    </section>

   
</body>
</html>