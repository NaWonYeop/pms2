<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.test.prj.user.service.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />

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

.list {
	margin-bottom: 20px;
}



.introduce {
	display: block;
}

.search {
	width: 57%;
	text-align: center;
	margin-top: 2%;
	margin-left: 21.5%;
}

.table.dataTable, thead, th, table.dataTable.no-footer, .table-bordered, .table-bordered td, 
	.table-bordered th, .table td, .table th, table.dataTable thead th, table.dataTable thead td {
	border: 0;
}


</style>
</head>
<body>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">PROJECT JOB</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">구직 리스트</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="search">
			<!-- 검색기능 -->
			<form action="jobsearch" >
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type" >
									<option value="nam"	selected>이름</option>
									<option value="ttl"	>제목</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control" 
								placeholder='' onfocus="this.placeholder = ''"
								onblur="this.placeholder = ''">
							<div class="input-group-append">
								<button class="btn" type="submit" style="padding: 0">
									<img alt="search" src="resources/main/img/search.png" height="37px" >
								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> 
					<input type="hidden" name="amount" value="5">
			</form>
				</div>
			
	
	<section class="special_cource padding_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>JOB</p>
						<h2>구직 리스트</h2>
					</div>
				</div>
			</div>
			
			<c:if test="${btnCheck.user_ath != 'user' && btnCheck.user_ath != null}">
				<div class="insertbtn">
					<button type="button" id="insertbtn" class="btn_1"
						onclick="location.href='jobInsertMove?cmd=jobMain'" style="margin-bottom: 2%;">등록 및 수정</button>
				</div>
			</c:if>
			
			<div class="textimonial_iner">
				<div class="testimonial_slider">
				<div claas="row">
				
					<c:if test="${!empty inters}">
						<c:forEach items="${inters }" var="inter">
							<div class="col-sm-12 col-lg-12 list">
									<div class="single_special_cource">
										<div class="special_cource_text">
											<p class="introduce">${inter.user_name }| ${inter.user_crr }년</p>
											<img id="heartbtn${inter.user_id}" class="heartbtn" onclick="heart(${inter.user_id})" alt="heart" src="resources/main/img/unheart.png" style="float: right">
											<img id="heartCancelbtn${inter.user_id}" class="heartCancelbtn" onclick="heartCancel(${inter.user_id})" alt="unheart" src="resources/main/img/heart.png" style="float: right">
	                    					
											<c:forEach items="${techs }" var="tech">
												<c:if test="${inter.user_id eq tech.user_id2 }">
													<span class="btn_4" style="margin-bottom: 1%">${tech.tech_name }</span>
												</c:if>
											</c:forEach>
											
											<a href="jobDetail?user_id=${inter.user_id }">
												<h3 style="margin-left: 5%">${inter.user_job_ttl }</h3>
											</a>
											<p style="margin-left: 5%">${inter.user_job_cnt }</p>
											<div class="author_info">
												<div class="author_img">
													<div class="author_info_text">
														<p>보유 자격증</p>
														<h5>
															<c:forEach items="${certs }" var="cert">
															<c:if test="${inter.user_id eq cert.user_id }">
																<a class="btn btn-outline-primary btn-fw" style="margin-bottom: 1%">${cert.cert_name }</a>
															</c:if>
															</c:forEach> 
														</h5>
													</div>
												</div>
												<div class="author_rating">
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
													<!-- <div>
														<span class="btn_4" style="padding-left: 5px; padding-right: 5px; font-size: small;">마감 12일전</span>
													</div> -->
												</div>
											</div>
										</div>
									</div>
								</div>
						
						</c:forEach>
					--------------찜끝
					</c:if>
				</div>
					<div class="row">
					<div id="data_list_wrapper" class="dataTables_wrapper no-footer" style="width: 100%;">
					<table id="data_list" class="table table-bordered">
					<thead><tr><th></th></tr></thead>
					<tbody>
						
				
						<c:forEach items="${jobs }" var="job">
							<c:if test="${!empty job.user_job_ttl  }">
							<tr>
							<td>
								<div class="col-sm-12 col-lg-12 list">
									<div class="single_special_cource">
										<div class="special_cource_text">
											<p class="introduce">${job.user_name }| ${job.user_crr }년</p>
											<img id="heartbtn${job.user_id}" class="heartbtn" onclick="heart(${job.user_id})" alt="heart" src="resources/main/img/unheart.png" style="float: right">
											<img id="heartCancelbtn${job.user_id}" class="heartCancelbtn" onclick="heartCancel(${job.user_id})" alt="unheart" src="resources/main/img/heart.png" style="float: right">
											<c:forEach items="${techs }" var="tech">
												<c:if test="${job.user_id eq tech.user_id2 }">
													<span class="btn_4" style="margin-bottom: 1%">${tech.tech_name }</span>
												</c:if>
											</c:forEach>
											<a href="jobDetail?user_id=${job.user_id }">
												<h3 style="margin-left: 5%">${job.user_job_ttl }</h3>
											</a>
											<p style="margin-left: 5%">${job.user_job_cnt }</p>
											<div class="author_info">
												<div class="author_img">
													<div class="author_info_text">
														<p>보유 자격증</p>
														<c:forEach items="${certs }" var="cert">
															<c:if test="${job.user_id eq cert.user_id }">
																<p class="btn btn-outline-primary btn-fw" style="margin-bottom: 1%">${cert.cert_name }</p>
															</c:if>
														</c:forEach> 
													</div>
												</div>
												<div class="author_rating">
													<div class="rating avg">
														<div class="star-ratings">
															<div class="star-ratings-fill"
																style="width: ${job.avg * 20 }%">
																<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
															</div>
															<div class="star-ratings-base">
																<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
															</div>
														</div>
														<p>평균 ${job.avg } 점</p>
													</div>
													
												</div>
											</div>
										</div>
									</div>
								</div>
								</td>
								</tr>
							</c:if>
							
						</c:forEach>
							
						</tbody>
					</table>
					</div>
						<!-- 여기까지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->

					</div>
				</div>
			</div>
		</div>
	</section>
<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
	
		function starAvg(avg) {
			const insertAvg = avg * 20;
			return insertAvg + 1.5;
		}
		
		jQuery(function($) {
			$("#data_list").DataTable({
				lengthChange : false,

				// 검색 기능 숨기기
				searching : false,

				// 정렬 기능 숨기기
				ordering : false,

				// 정보 표시 숨기기
				info : false,

				displayLength : 3
			});
		});
		
		<% UserVO user=(UserVO)session.getAttribute("sessionUser");%>
	    $(document).ready(function(){
		    <%if(user==null)
		    {%>
		       $('.heartbtn').hide();
		       $('.heartCancelbtn').hide();
		    <%}
		    else
		    {%>
		    if("${heartCheck}" != "no") {
		    	$('.heartbtn').hide();
		    } else {
		    	$('.heartCancelbtn').hide();
		    }
		    <%}%>
	    })
	    
	    function heart(e) {
        <% 
        if(user==null)
        {%>
           toastr.warning('로그인이 필요합니다.');
           
        <%}
        else
        {%>
        $.ajax({
    		url: 'heartInsert',
    		type: 'post',
    		data: {
    			user_id: ${sessionUser.user_id},
    			user_id2: e
    		},
    		success: function() {
    			toastr.success('찜하기 성공!');
    			$('#heartbtn'+e).hide();
        		$('#heartCancelbtn'+e).show();	
    		}
    	})
    	
        <%}%>;
  		}
        
        function heartCancel(e) {
        	<% 
            if(user==null)
            {%>
               toastr.warning('로그인이 필요합니다.');
               
            <%}
            else
            {%>
        	$.ajax({
        		url: 'heartCancel',
        		type: 'post',
        		data: {
        			user_id: ${sessionUser.user_id},
        			user_id2: e
        		}
        	}).done(function() {
        		toastr.success('찜하기 취소되었습니다.');
        		$('#heartbtn'+e).show();
    			$('#heartCancelbtn'+e).hide();
    			
        	})
        	<%}%>;
        }
	</script>

</body>
</html>