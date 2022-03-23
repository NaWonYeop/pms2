<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.blog_details {
	background-color: #F5F7FF;
}

ul {
    margin-bottom: 3%;
}

/* modal css*/
.modaldal { 
    display:none;
    width: 40%;
    height: 40%;
    border-radius: 30px;
    border: 3px solid #798BF2;
    background-color: #F5F7FF;
    position: fixed;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    z-index: 3;
}


.modalcontent {
    margin-top: 50px;
    
}

/* 모달창의 배경을 만든다 */
.modal__background{
  display:none;
  position: fixed;
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(0, 0, 0, 0.3);
}
</style>
<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script> 
<script src="resources/js/rewardFnc.js"></script>
</head>
<body>
    <!-- 검은블록-->
    <section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">MY FUNDING</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">나의 펀딩</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
    <!-- breadcrumb start-->

    <!-- ================ 바디부분 ================= -->
    <section class="contact-section section_padding">
        <div class="container" style="margin-top: 7%; margin-bottom: 15%">



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
							<div class="blog_details col-3" style="display: inline-block; margin-bottom: 2%; margin-right: 6%;">
								<div class="blog_item_img">

									<img class="card-img rounded-0"
										src="./resources/upload/images/${fun.ctf_st_name }"
										alt="사진이 없습니다.">

								</div>
								<div class="col-lg-12" style="margin-top: 5%; text-align: center;">
								<a class="d-inline-block" href="projectSelect?prj_id=${fun.prj_id }" style=" margin-bottom: 7%;">
									<h3 style="word-break: break-all;">${fun.prj_name }</h3>
								</a> 
									<h5 style="text-align: center;">${fun.rwd_name }</h5>
								</div>
								
								<ul class="blog-info-link">
									<li>구매일 : <fmt:formatDate value="${fun.buy_date }" pattern="yyyy-MM-dd" /></li>
								</ul>
								<ul class="blog-info-link">
									<li>단가 : ${fun.rwd_prc } </li>
								</ul>
								<ul class="blog-info-link">
									<li>구매 수량 : ${fun.buy_count } </li>
								</ul>
								<ul class="blog-info-link">
									<li>구매 방법 : ${fun.buy_way } </li>
								</ul>
								<ul class="blog-info-link" style="margin-bottom: 10%;">
									<li>
										결제액 :
										<c:if test="${fun.buy_won != 0 }">
											<a id="pay${fun.buy_id }">${fun.buy_won }</a> 원
										</c:if>   
										<c:if test="${fun.buy_wei != 0 }">
											<a id="pay${fun.buy_id }">${fun.buy_wei }</a> wei
										</c:if> 
									</li>
								</ul>
								<input type="hidden" id="${fun.buy_id }" value="${fun.buy_id }">
								<input type="hidden" id="muID${fun.buy_id }" value="${fun.buy_muid }">
								
								
								
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
 <script src="resources/main/js/jquery.counterup.min.js"></script>
<script src="resources/main/js/custom.js"></script>
   
</body>
</html>