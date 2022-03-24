<%@page import="co.test.prj.tech.service.TechVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.test.prj.tech.service.TechVO"%>
<%@page import="co.test.prj.user.service.UserVO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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

.table.dataTable, thead, th, table.dataTable.no-footer, .table-bordered,
	.table-bordered td, .table-bordered th, .table td, .table th, table.dataTable thead th,
	table.dataTable thead td {
	border: 0;
}

.insertbtn {
	margin-bottom: 3%;
	margin-top: 3%;
	text-align: center;
	display: flex;
    justify-content: center;
}

/* slide start */
.slider {
	margin: 0 auto;
	max-width: 940px;
}

.slide_viewer {
	height: 340px;
	overflow: hidden;
	position: relative;
}

.slide_group {
	height: 100%;
	position: relative;
	width: 100%;
}

.slide {
	display: none;
	height: 100%;
	position: absolute;
	width: 100%;
}

.slide:first-child {
	display: block;
}

.slide_buttons {
	left: 0;
	position: absolute;
	right: 0;
	text-align: center;
}

a.slide_btn {
	color: #474544;
	font-size: 42px;
	margin: 0 0.175em;
	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
}

.slide_btn.active, .slide_btn:hover {
	color: #428CC6;
	cursor: pointer;
}

.directional_nav {
	display: inline-block;
	height: 340px;
	margin: 0 auto;
	max-width: 940px;
	position: relative;
	top: -340px;
}

.previous_btn {
	bottom: 0;
	left: 0px;
	margin: auto;
	position: absolute;
	top: -30px;
}

.next_btn {
	bottom: 0;
	margin: auto;
	position: absolute;
	right: -1105px;
	top: -30px;
}

.previous_btn, .next_btn {
	cursor: pointer;
	height: 65px;
	opacity: 0.5;
	-webkit-transition: opacity 0.4s ease-in-out;
	-moz-transition: opacity 0.4s ease-in-out;
	-ms-transition: opacity 0.4s ease-in-out;
	-o-transition: opacity 0.4s ease-in-out;
	transition: opacity 0.4s ease-in-out;
	width: 65px;
}

.previous_btn:hover, .next_btn:hover {
	opacity: 1;
}

@media only screen and (max-width: 767px) {
	.previous_btn {
		left: 50px;
	}
	.next_btn {
		right: 50px;
	}
}
/* slide end */
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
				<div class="insertbtn col-lg-12">
					<button type="button" id="insertbtn" class="btn_1"
						onclick="location.href='jobInsertMove?cmd=jobMain'"
						style="width: 40%;">등록 및 수정</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="insertbtn col-lg-12">
					<button type="button" id="insertbtn" class="btn_1"
						onclick="location.href='jobInsertMove?cmd=jobMain'"
						style="width: 20%;">마이 페이지</button>
					<button type="button" id="insertbtn" class="btn_1"
						onclick="location.href='jobDetail?user_id=${sessionUser.user_id}'"
						style="width: 20%; margin-left: 5%;">등록 및 수정</button>
				</div>

			</c:otherwise>
		</c:choose>
	</c:if>
	<div class="search">
		<!-- 검색기능 -->
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


	<section class="special_cource padding_top">
		<div class="container" style="margin-top: 5%;">
			<div class="row justify-content-center">
				<div class="col-xl-5">
					<div class="section_tittle text-center">
						<p>JOB</p>
						<h2>찜 리스트</h2>
					</div>
				</div>
			</div>
		</div>
	</section>



	<section class="special_cource padding_top">
		<div class="container">


			<div class="textimonial_iner">
				<div class="testimonial_slider">
					<div claas="row" style="height: 500px;">
						<div class="slider">
							<div class="slide_viewer">
								<div class="slide_group">
									<c:if test="${!empty inters}">
										<c:forEach items="${inters }" var="inter">
											<div class="slide">
												<div class="col-sm-12 col-lg-12 list">
													<div class="single_special_cource">
														<div class="special_cource_text"
															style="border: 2px solid #798BF2; border-radius: 10px;">
															<p class="introduce">${inter.user_name }|
																${inter.user_crr }년</p>
															<img id="heartbtn${inter.user_id}" class="heartbtn"
																name="heartbtn${inter.user_id}"
																onclick="heart(${inter.user_id})" alt="heart"
																src="resources/main/img/unheart.png"
																style="float: right"> <img
																id="heartCancelbtn${inter.user_id}"
																class="heartCancelbtn"
																name="heartCancelbtn${inter.user_id}"
																onclick="heartCancel(${inter.user_id})" alt="unheart"
																src="resources/main/img/heart.png" style="float: right">

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
																					<a class="btn btn-outline-primary btn-fw"
																						style="margin-bottom: 1%">${cert.cert_name }</a>
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

											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
						<div class="slide_buttons"></div>

						<div class="directional_nav">
							<div class="previous_btn" title="Previous">
								<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									width="65px" height="65px" viewBox="-11 -11.5 65 66">
        <g>
          <g>
            <path fill="#474544"
										d="M-10.5,22.118C-10.5,4.132,4.133-10.5,22.118-10.5S54.736,4.132,54.736,22.118
        c0,17.985-14.633,32.618-32.618,32.618S-10.5,40.103-10.5,22.118z M-8.288,22.118c0,16.766,13.639,30.406,30.406,30.406 c16.765,0,30.405-13.641,30.405-30.406c0-16.766-13.641-30.406-30.405-30.406C5.35-8.288-8.288,5.352-8.288,22.118z" />
            <path fill="#474544"
										d="M25.43,33.243L14.628,22.429c-0.433-0.432-0.433-1.132,0-1.564L25.43,10.051c0.432-0.432,1.132-0.432,1.563,0	c0.431,0.431,0.431,1.132,0,1.564L16.972,21.647l10.021,10.035c0.432,0.433,0.432,1.134,0,1.564	c-0.215,0.218-0.498,0.323-0.78,0.323C25.929,33.569,25.646,33.464,25.43,33.243z" />
          </g>
        </g>
      </svg>
							</div>
							<div class="next_btn" title="Next">
								<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									width="65px" height="65px" viewBox="-11 -11.5 65 66">
        <g>
          <g>
            <path fill="#474544"
										d="M22.118,54.736C4.132,54.736-10.5,40.103-10.5,22.118C-10.5,4.132,4.132-10.5,22.118-10.5	c17.985,0,32.618,14.632,32.618,32.618C54.736,40.103,40.103,54.736,22.118,54.736z M22.118-8.288	c-16.765,0-30.406,13.64-30.406,30.406c0,16.766,13.641,30.406,30.406,30.406c16.768,0,30.406-13.641,30.406-30.406 C52.524,5.352,38.885-8.288,22.118-8.288z" />
            <path fill="#474544"
										d="M18.022,33.569c 0.282,0-0.566-0.105-0.781-0.323c-0.432-0.431-0.432-1.132,0-1.564l10.022-10.035 			L17.241,11.615c 0.431-0.432-0.431-1.133,0-1.564c0.432-0.432,1.132-0.432,1.564,0l10.803,10.814c0.433,0.432,0.433,1.132,0,1.564 L18.805,33.243C18.59,33.464,18.306,33.569,18.022,33.569z" />
          </g>
        </g>
      </svg>
							</div>
						</div>
						
						<!-- End // .directional_nav -->
					</div>
					<section class="special_cource padding_top">
						<div class="container" style="margin-top: 5%;">
							<div class="row justify-content-center">
								<div class="col-xl-5">
									<div class="section_tittle text-center">
										<p>JOB</p>
										<h2>구직 리스트</h2>
									</div>
								</div>
							</div>
						</div>
					</section>


					<div class="row">
						<div id="data_list_wrapper" class="dataTables_wrapper no-footer"
							style="width: 100%;">
							<table id="data_list" class="table table-bordered">
								<thead>
									<tr>
										<th></th>
									</tr>
								</thead>
								<tbody>


									<c:forEach items="${jobs }" var="job">
										<c:if test="${!empty job.user_job_ttl  }">
											<tr>
												<td>
													<div class="col-sm-12 col-lg-12 list">
														<div class="single_special_cource">
															<div class="special_cource_text">
																<p class="introduce">${job.user_name }|
																	${job.user_crr }년</p>
																<img id="heartbtn${job.user_id}" class="heartbtn"
																	name="heartbtn${job.user_id}"
																	onclick="heart(${job.user_id})" alt="heart"
																	src="resources/main/img/unheart.png"
																	style="float: right"> <img
																	id="heartCancelbtn${job.user_id}"
																	class="heartCancelbtn"
																	name="heartCancelbtn${job.user_id}"
																	onclick="heartCancel(${job.user_id})" alt="unheart"
																	src="resources/main/img/heart.png" style="float: right">
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
																					<p class="btn btn-outline-primary btn-fw"
																						style="margin-bottom: 1%">${cert.cert_name }</p>
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
		
		<%UserVO user = (UserVO) session.getAttribute("sessionUser");%>
	    $(document).ready(function(){
		    <%List<UserVO> userId2 = (List<UserVO>) request.getAttribute("inters");
List<UserVO> allList = (List<UserVO>) request.getAttribute("jobs");

if (user == null) {%>
		       $('.heartbtn').hide();
		       $('.heartCancelbtn').hide();
		    <%} else {
	for (int i = 0; i < allList.size(); i++) {%>$('img[name=heartCancelbtn<%=allList.get(i).getUser_id()%>]').hide();	<%for (int j = 0; j < userId2.size(); j++) {
	if (allList.get(i).getUser_id() == userId2.get(j).getUser_id()) {%> $('img[name=heartCancelbtn<%=userId2.get(j).getUser_id()%>]').show();	
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
        
        /* slide */
        $('.slider').each(function() {
        	  var $this = $(this);
        	  var $group = $this.find('.slide_group');
        	  var $slides = $this.find('.slide');
        	  var bulletArray = [];
        	  var currentIndex = 0;
        	  var timeout;
        	  
        	  function move(newIndex) {
        	    var animateLeft, slideLeft;
        	    
        	    advance();
        	    
        	    if ($group.is(':animated') || currentIndex === newIndex) {
        	      return;
        	    }
        	    
        	    bulletArray[currentIndex].removeClass('active');
        	    bulletArray[newIndex].addClass('active');
        	    
        	    if (newIndex > currentIndex) {
        	      slideLeft = '100%';
        	      animateLeft = '-100%';
        	    } else {
        	      slideLeft = '-100%';
        	      animateLeft = '100%';
        	    }
        	    
        	    $slides.eq(newIndex).css({
        	      display: 'block',
        	      left: slideLeft
        	    });
        	    $group.animate({
        	      left: animateLeft
        	    }, function() {
        	      $slides.eq(currentIndex).css({
        	        display: 'none'
        	      });
        	      $slides.eq(newIndex).css({
        	        left: 0
        	      });
        	      $group.css({
        	        left: 0
        	      });
        	      currentIndex = newIndex;
        	    });
        	  }
        	  
        	  function advance() {
        	    clearTimeout(timeout);
        	    timeout = setTimeout(function() {
        	      if (currentIndex < ($slides.length - 1)) {
        	        move(currentIndex + 1);
        	      } else {
        	        move(0);
        	      }
        	    }, 4000);
        	  }
        	  
        	  $('.next_btn').on('click', function() {
        	    if (currentIndex < ($slides.length - 1)) {
        	      move(currentIndex + 1);
        	    } else {
        	      move(0);
        	    }
        	  });
        	  
        	  $('.previous_btn').on('click', function() {
        	    if (currentIndex !== 0) {
        	      move(currentIndex - 1);
        	    } else {
        	      move(3);
        	    }
        	  });
        	  
        	  $.each($slides, function(index) {
        	    var $button = $('<a class="slide_btn">&bull;</a>');
        	    
        	    if (index === currentIndex) {
        	      $button.addClass('active');
        	    }
        	    $button.on('click', function() {
        	      move(index);
        	    }).appendTo('.slide_buttons');
        	    bulletArray.push($button);
        	  });
        	  
        	  advance();
        	});
        
	</script>

</body>
</html>