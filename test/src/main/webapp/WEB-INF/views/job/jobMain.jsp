<%@page import="co.test.prj.tech.service.TechVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.test.prj.tech.service.TechVO"%>
<%@page import="co.test.prj.user.service.UserVO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html ng-app="ionicApp">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

<script
	src="https://code.ionicframework.com/1.0.0-beta.4/js/ionic.bundle.js"></script>
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" /> -->

<title>Insert title here</title>
<style>
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-color: #2b2a29;
}
.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}
.star-ratings-base {
	z-index: 0;
	padding: 0;
}
.rating {
	display: inline-block;
	float: right;
	margin-right: 10px;
}
.insertbtn {
	margin-top: 4%;
    margin-bottom: 3%;
    display: flex;
    justify-content: space-around;
}
.search {
	width: 50%;
    margin-left: 25%;
}
.testimonial_part .owl-dots {
	margin-left: 0;
	padding-top: 25px;
}
</style>
</head>
<body ng-controller="AppCtrl">
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">PROJECT JOB</h2>
						</div>
					</div>
					<div>
						<h4 style="float: right; color: #fff">구직</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:if
		test="${btnCheck.user_ath != 'user' && btnCheck.user_ath != null}">
		<c:choose>
			<c:when test="${btnCheck.user_job_ttl eq null }">
				<div class="insertbtn">
					<button type="button" id="insertbtn" class="btn_1"
						onclick="location.href='jobInsertMove?cmd=jobMain'"
						style="width: 40%;">등록 및 수정</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="insertbtn">
					<button type="button" id="insertbtn" class="btn_1"
						onclick="location.href='jobInsertMove?cmd=jobMain'"
						style="width: 20%; margin-left: 25%;">등록 및 수정</button>
					<button type="button" id="insertbtn" class="btn_1"
						onclick="location.href='jobDetail?user_id=${sessionUser.user_id}'"
						style="width: 20%; margin-right: 25%;">나의 구직</button>
				</div>

			</c:otherwise>
		</c:choose>
	</c:if>
	<div class="search">
		<!-- 검색기능 -->
		<br><br>
		<form action="jobsearch">
			<div class="form-group">
				<div class="input-group mb-3">
					<div class="form-select" id="default-select" style="width: 25%;">
						<select name="type">
							<option value="nam" selected>이름</option>
							<option value="ttl">제목</option>
						</select>
					</div>
					<input type="text" name="keyword" class="form-control"
						placeholder='' onfocus="this.placeholder = ''"
						onblur="this.placeholder = ''">
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
	</div>


	<section class="testimonial_part">
		<div class="container-fluid">

			<div class="row justify-content-center" style="margin-top: 5%;">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>JOB</p>
						<h2>찜 리스트</h2>
					</div>
				</div>
			</div>

			<!-- -------------------------------------찜 start----------------------------------------- -->
			<c:if test="${!empty inters}">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="textimonial_iner owl-carousel">
								<c:forEach items="${inters }" var="inter">
									<div class="testimonial_slider">
										<div class="row">

											<div class="col-lg-12 col-xl-12 col-sm-12 align-self-center">
												<div class="testimonial_slider_text">
													<p class="introduce">${inter.user_name }|
														${inter.user_crr }년</p>
													<img id="heartbtn${inter.user_id}" class="heartbtn"
														name="heartbtn${inter.user_id}"
														onclick="heart(${inter.user_id})" alt="heart"
														src="resources/main/img/unheart.png" style="float: right">
													<img id="heartCancelbtn${inter.user_id}"
														class="heartCancelbtn"
														name="heartCancelbtn${inter.user_id}"
														onclick="heartCancel(${inter.user_id})" alt="unheart"
														src="resources/main/img/heart.png" style="float: right">


													<c:forEach items="${techs }" var="tech">
														<c:if test="${inter.user_id eq tech.user_id2 }">
															<span class="btn_4" style="margin-bottom: 1%;">${tech.tech_name }</span>
														</c:if>
													</c:forEach>

													<a href="jobDetail?user_id=${inter.user_id }"><h3
															style="font-size: 35px; margin-left: 5%;">${inter.user_job_ttl }</h3></a>
													<p style="margin-left: 5%;">${inter.user_job_cnt }</p>
													<div class="author_info">
														<div class="author_rating" style="float: right">
															<div class="rating avg">
																<div class="star-ratings">
																	<div class="star-ratings-fill"
																		style="width: ${inter.avg * 20 }%">
																		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																	</div>
																	<div class="star-ratings-base">
																		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																	</div>
																</div>
																<p>평균 ${inter.avg } 점</p>
															</div>

														</div>
														<div class="author_img">
															<div class="author_info_text">
																<p>보유 자격증</p>
																<h5>
																	<c:forEach items="${certs }" var="cert">
																		<c:if test="${inter.user_id eq cert.user_id }">
																			<a class="btn btn-outline-primary btn-fw"
																				style="margin-bottom: 1%;">${cert.cert_name }</a>
																		</c:if>
																	</c:forEach>
																</h5>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</section>
	<!-- -------------------------------------찜 end----------------------------------------- -->
	
	<!-- ----------------------------------------구직list start-------------------------------------- -->
	<section class="testimonial_part" style="touch-action: none;">
		<div class="container-fluid">

			<div class="row justify-content-center" style="margin-top: 5%;">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>JOB</p>
						<h2>구직 리스트</h2>
					</div>
				</div>
			</div>
			<div style="text-align: center; margin-bottom: 3%;">
		        Page: {{currentPage}}  Total: {{pageSize}}
			</div>
		        <ion-list>
		            <ion-item ng-repeat="jobs in jobs | limitTo:pageSize">
		            	<%-- <c:if test="${!empty jobs.user_job_ttl}"> --%>
							<div ng-if="jobs.user_job_ttl" class="container" style="margin-bottom: 3%;"> 
								<div class="row">
									<div class="col-lg-12">
										<%-- <c:forEach items="${jobs }" var="job"> --%>
											<!-- <div class="testimonial_slider"> -->
											<div class="row" style="margin-bottom: 4%;">
												<div class="col-lg-12 col-xl-12 col-sm-12 align-self-center">
													<p class="introduce">{{jobs.user_name}} | {{jobs.user_crr}}년</p>
													<img id="{{'heartbtn'+jobs.user_id}}" class="heartbtn"
													name="{{'heartbtn'+jobs.user_id}}" ng-click="heart(jobs.user_id)"
													alt="heart" src="resources/main/img/unheart.png"
													style="float: right"> 
													<img
													id="{{'heartCancelbtn'+jobs.user_id}}" class="heartCancelbtn"
													name="{{'heartCancelbtn'+jobs.user_id}}"
													ng-click="heartCancel(jobs.user_id)" alt="unheart"
													src="resources/main/img/heart.png" style="float: right">
													
													<span ng-repeat="tech in techs" ng-if="jobs.user_id == tech.user_id2" class="btn_4" style="margin: 8px 5px;">{{tech.tech_name}}</span>
													
													<a href="jobDetail?user_id={{jobs.user_id}}"><h3
															style="font-size: 35px; margin-left: 5%;">{{jobs.user_job_ttl}}</h3></a>
													<p style="margin-left: 5%;">{{jobs.user_job_cnt}}</p>
													<div class="author_info">
														<div class="author_rating" style="float: right">
															<div class="rating avg">
																<div class="star-ratings">
																	<div class="star-ratings-fill"
																		style="width: jobs.avg * 20 %">
																		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																	</div>
																	<div class="star-ratings-base">
																		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																	</div>
																</div>
																<p>평균 {{jobs.avg}} 점</p>
															</div>
			
														</div>
														<div class="author_img">
															<div class="author_info_text">
																<p>보유 자격증</p>
																<h5>
																<a class="btn btn-outline-primary btn-fw" ng-repeat="cert in certs" ng-if="jobs.user_id == cert.user_id"
																				style="margin-bottom: 1%; margin-right: 1%">{{cert.cert_name }}</a>
																</h5>
															</div>
														</div>
			
													</div>
												</div>
											</div>
										<%-- </c:forEach> --%>
									</div>
								</div>
							</div>
						<%-- </c:if> --%>
		            </ion-item>
		        </ion-list>
		        <button ng-click="loadNextPage()" class="btn_4">
		            더보기
		        </button>
		        
		</div>
	</section>
	<!-- ---------------------------------구직list end------------------------------------------ -->


	<script type="text/javascript">
	
	angular.module('ionicApp', ['ionic'])
	.controller('AppCtrl', function($scope) {
		var DEFAULT_PAGE_SIZE_STEP = 3;
	      
	      $scope.currentPage = 1;
	      $scope.pageSize = $scope.currentPage * DEFAULT_PAGE_SIZE_STEP;  
	      
	      $scope.loadNextPage = function(){
	        $scope.currentPage++;
	        $scope.pageSize = $scope.currentPage * DEFAULT_PAGE_SIZE_STEP;
	        
	        
	      }
	      
		$scope.jobs = [
		<c:forEach items="${jobs}" var="job">
		    {user_id : ${job.user_id}, user_name : '${job.user_name}', user_crr : '${job.user_crr}', user_job_ttl: '${job.user_job_ttl}', user_job_cnt: '${job.user_job_cnt}', avg: ${job.avg}},
		</c:forEach>
		];
		
		$scope.techs = [
			<c:forEach items="${techs}" var="tech">
				{tech_id : ${tech.user_id}, user_id2: ${tech.user_id2}, tech_name: '${tech.tech_name}' },
			</c:forEach>
		];
		
		$scope.certs = [
			<c:forEach items="${certs}" var="cert">
				{cert_name: '${cert.cert_name}', user_id: ${cert.user_id} },
			</c:forEach>
		];
		
		$scope.heart = function(e) {
			if("${sessionUser.user_id}" != e) {
		        $.ajax({
		    		url: 'heartInsert',
		    		type: 'post',
		    		data: {
		    			user_id: '${sessionUser.user_id}',
		    			user_id2: e
		    		},
		    		success: function() {
		    			toastr.success('찜하기 성공!');
		    			$('img[name=heartbtn'+e+']').hide();
		        		$('img[name=heartCancelbtn'+e+']').show();	
		    		}
		    	})
				
			} else {
				toastr.error('본인입니다.');
			}
	    	
	  		}
		
		$scope.heartCancel = function(e) {
        	if("${sessionUser.user_id}" != e) {
        		$.ajax({
            		url: 'heartCancel',
            		type: 'post',
            		data: {
            			user_id: '${sessionUser.user_id}',
            			user_id2: e
            		}
            	}).done(function() {
            		toastr.success('찜하기 취소되었습니다.');
            		$('img[name=heartbtn'+e+']').show();
        			$('img[name=heartCancelbtn'+e+']').hide();
        			
            	})
        	} else {
        		toastr.error('본인입니다.');
        	}
        	
        	
        }
	})
	
		function starAvg(avg) {
			const insertAvg = avg * 20;
			return insertAvg + 1.5;
		}
		
		
		<%UserVO user = (UserVO) session.getAttribute("sessionUser");%>
	    $(document).ready(function(){
		    <%List<UserVO> userId2 = (List<UserVO>) request.getAttribute("inters");
			List<UserVO> allList = (List<UserVO>) request.getAttribute("jobs");
			if (user == null) {%>
		       $('.heartbtn').hide();
		       $('.heartCancelbtn').hide();
		    <%} else {
				for (int i = 0; i < allList.size(); i++) {%>
				$('img[name=heartCancelbtn<%=allList.get(i).getUser_id()%>]').hide();	
				<%for (int j = 0; j < userId2.size(); j++) {
					if (allList.get(i).getUser_id() == userId2.get(j).getUser_id()) {%> 
					$('img[name=heartCancelbtn<%=userId2.get(j).getUser_id()%>]').show();	
					 		$('img[name=heartbtn<%=userId2.get(j).getUser_id()%>]').hide();  <%}
				}
				}
			}%>
	    })
	    
	    function heart(e) {
        
        $.ajax({
    		url: 'heartInsert',
    		type: 'post',
    		data: {
    			user_id: '${sessionUser.user_id}',
    			user_id2: e
    		},
    		success: function() {
    			toastr.success('찜하기 성공!');
    			$('img[name=heartbtn'+e+']').hide();
        		$('img[name=heartCancelbtn'+e+']').show();	
    		}
    	})
    	
  		}
        
        function heartCancel(e) {
        	
        	$.ajax({
        		url: 'heartCancel',
        		type: 'post',
        		data: {
        			user_id: '${sessionUser.user_id}',
        			user_id2: e
        		}
        	}).done(function() {
        		toastr.success('찜하기 취소되었습니다.');
        		$('img[name=heartbtn'+e+']').show();
    			$('img[name=heartCancelbtn'+e+']').hide();
    			
        	})
        	
        }
	</script>
	<script src="resources/main/js/custom.js"></script>

</body>
</html>