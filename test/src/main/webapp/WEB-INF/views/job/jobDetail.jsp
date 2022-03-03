<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .Tname {
            margin-bottom: 60px;
        }

        .btn_4 {
            margin-top: 4px;
            margin-bottom: 4px;
            margin-left: 5px;
        }

        .prjtitle {
            font-size: large;
            font-weight: bold;
        }

        .btn_4 {
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .prjcontent {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .btn_1 {
            margin-top: 20px;
            text-align: center;
        }

        /* modal css*/
        .modaldal { 
            display:none;
            width: 40%;
            height: 35%;
            border-radius: 30px;
            background-color: tomato;
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
        .prjtitle {
            font-size: xx-large;
        }

        .prjlist {
            width: 300px;
            text-align: center;
            
        }
        /* modal end */

        /* rating */
        .star-ratings {
        color: #aaa9a9; 
        position: relative;
        unicode-bidi: bidi-override;
        width: max-content;
        -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
        
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
        }
        /* rating end */

        .callbtn , .heartbtn, .call {
            width: 300px;
            height: 45px;
            border-radius: 30px;
            background-color: rgb(209, 130, 84);
            border: bisque;
            margin-top: 10px;
            margin-bottom: 10px;
        }
    
        .call {
            margin-top: 50px;
            text-align: center;
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
                            <h2>구..직 상..세</h2>
                            <p>Home<span>/</span>Course Details</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================ Start Course Details Area =================-->
    
    <section class="course_details_area section_padding">
        <div class="container">
        	
        	
	            <div class="col-12 Tname">
	                <h4 class="title_top" style="font-size: 50px;">개발자 ${jobDetail.user_name }</h4>
	            </div>
	            	<c:forEach items="${certDetail }" var="certList">
				    	<div class="col-8 course_details_left">
				        	<span class="btn_4">${certList.cert_name }</span>
				        </div>
			        </c:forEach>
	            <div class="row">
	                <div class="col-lg-8 course_details_left">
	                    <!-- <div class="main_image">
	                        <img class="img-fluid" src="img/single_cource.png" alt="">
	                    </div> -->
	                    <div class="content_wrapper">
	                        <h4 class="title_top">${jobDetail.user_job_ttl }</h4>
	                        <div class="content">
	                            ${jobDetail.user_job_cnt }
	                        </div>
	
	                        <h4 class="title">참여 프로젝트</h4>
	                        
	                        <c:forEach items="${prjDetail }" var="prjList">
		                        <div class="content">
		                            <div class="prjtitle">${prjList.prj_name }</div>
		                            <span class="btn_4">${prjList.tm_pos }</span>
		                            <span class="btn_4">${prjList.tm_dept }</span><br>
		                            
		                            <fmt:formatDate value="${prjList.prj_str }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${prjList.prj_ed }" pattern="yyyy-MM-dd" />
		                        </div>
	                        </c:forEach>
	                        
	                    </div>
	                </div>
	
	
	                <div class="col-lg-4 right-contents">
	                    
	                    <button type="button" id="heartbtn" class="heartbtn">찜하기</button>
	                    <!-- <a type="button" class="btn_1 d-block callbtn" id="callbtn" name="callbtn">신청하기</a> -->
	                    <button type="button" id="callbtn" class="callbtn">신청하기</button>
	                    <h4 class="title_top">${jobDetail.user_age }세 | 경력 ${jobDetail.user_crr }년</h4>
	                    
	                    <div class="modaldal content">
	                        <div class="content modalcontent">
	                            <div class="justify-content-center">
	                                <h2 class="content prjtitle" style="text-align: center;">진행중인 프로젝트</h2>
	                                <p class="content prj">프로젝트</p>
	                                
	                                <div class="content form-select" id="dropdown">
	                                    <select class="content prjlist">
	                                    	<c:forEach items="${prjList }" var="prjList">
		                                        <option value="1">${prjList.prj_name }</option>
	                                    	</c:forEach>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <button type="button" class="call">신청하기</button>
	                    </div>
	                    
	                    <div class="">
	                        <h4 class="title_top">보유기술</h4>
	                        <c:forEach items="${techDetail }" var="techList">
		                        <span class="btn_4">${techList.tech_name }</span>
	                        </c:forEach>
	                    </div>
	
	                    <h4 class="title_top">평점</h4>
	                    <div class="content">
	                        <div class="review-top row pt-40">
	                            <div class="col-lg-12">
	
	                                <div class="d-flex flex-row reviews justify-content-between">
	                                    <span>평점</span>
	                                        <div class="rating">
	                                            <div class="star-ratings">
	                                                <div class="star-ratings-fill" style=" width: ${starDetail.str_avg * 20}% ">
	                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                                <div class="star-ratings-base">
	                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    <span>${starDetail.str_avg } 점</span>
	                                </div>
	                                <h6 class="mb-15">상세평점</h6>
	                                
	                                <div class="d-flex flex-row reviews justify-content-between">
	                                    <span>전문성</span>
	                                        <div class="rating">
	                                            <div class="star-ratings">
	                                                <div class="star-ratings-fill" style=" width: ${starDetail.str_prfsn * 20}% ">
	                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                                <div class="star-ratings-base">
	                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    <span>${starDetail.str_prfsn } 점</span>
	
	                                    
	                                </div>
	                                <div class="d-flex flex-row reviews justify-content-between">
	                                    <span>일정준수</span>
	                                        <div class="rating">
	                                            <div class="star-ratings">
	                                                <div class="star-ratings-fill" style=" width: ${starDetail.str_obs * 20 }% ">
	                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                                <div class="star-ratings-base">
	                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    <span>${starDetail.str_obs } 점</span>
	                                </div>
	                                <div class="d-flex flex-row reviews justify-content-between">
	                                    <span>적극성</span>
	                                        <div class="rating">
	                                            <div class="star-ratings">
	                                                <div class="star-ratings-fill" style=" width: ${starDetail.str_pos * 20 }% ">
	                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                                <div class="star-ratings-base">
	                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    <span>${starDetail.str_pos } 점</span>
	                                </div>
	                                <div class="d-flex flex-row reviews justify-content-between">
	                                    <span>의사소통</span>
	                                        <div class="rating">
	                                            <div class="star-ratings">
	                                                <div class="star-ratings-fill" style=" width: ${starDetail.str_comm * 20 }% ">
	                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                                <div class="star-ratings-base">
	                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    <span>${starDetail.str_comm } 점</span>
	                                </div>
	                                <div class="d-flex flex-row reviews justify-content-between">
	                                    <span>재고용 의사</span>
	                                        <div class="rating">
	                                            <div class="star-ratings">
	                                                <div class="star-ratings-fill" style=" width: ${starDetail.str_re_empl * 20 }% ">
	                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                                <div class="star-ratings-base">
	                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    <span>${starDetail.str_re_empl } 점</span>
	                                </div>
	
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
        </div>
    </section>
    <script>
        
        function check(e)
        {
            if(!$(e.target).hasClass("content")&& !$(e.target).hasClass("callbtn") 
                && !$(e.target).hasClass("option") && !$(e.target).hasClass("current")) {
                $('.modaldal').fadeOut();
            }
        }
        $('html').click(function(e){
            console.log(e.target);
            check(e);
        });
        $('#callbtn').click(function(e){
            $('.modaldal').fadeIn();
        });
    </script>
</body>
</html>