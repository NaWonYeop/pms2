<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="co.test.prj.user.service.UserVO"%>
<%@page import="co.test.prj.interest.service.InterestVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
        .prjtitle {
            font-size: xx-large;
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
        /* display: flex; */
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

        .callbtn , .heartbtn, .updatebtn {
            width: 300px;
            height: 45px;
            border-radius: 30px;
            background-color: rgb(209, 130, 84);
            border: bisque;
            margin-top: 10px;
            margin-bottom: 10px;
        }
    
        .call {
            background-color: bisque;
            width: 80%;
            height: 10%;
            border-radius: 10px;
            margin-top: 10%;
            text-align: center;
            
        }
        
        .modalInbtn {
        	    width: 75%;
			    height: 15%;
			    align-content: center;
			    margin-top: 15%;
        }
        
        .form-select .nice-select {
        	width: 100%;
        	text-align: center;
        	background-color: #fff;
        	
        }
        
      
       
       #dropdown {
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
                            <h2>구..직 상세</h2>
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
				        <span class="btn_4">${certList.cert_name }</span>
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
	                        
							<div class="joinPrj">
	                        <c:forEach items="${prjDetail }" var="prjList">
		                        <div class="content"  style="background-color: #F5F7FF; margin-bottom: 3%; border-radius: 10px;">
		                            <div class="prjtitle">${prjList.prj_name }</div>
		                            <span class="btn_4" style="background-color: #F27457;">${prjList.tm_pos }</span>
		                            <span class="btn_4" style="background-color: #F27457;">${prjList.tm_dept }</span><br>
		                            
		                            <fmt:formatDate value="${prjList.prj_str }" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${prjList.prj_ed }" pattern="yyyy-MM-dd" />
		                        </div>
	                        </c:forEach>
	                        </div>
	                    </div>
	                </div>
	
	
	                <div class="col-lg-4 right-contents">
	                    <c:choose>
	                    	<c:when test="${sessionUser.user_id eq jobDetail.user_id }">
	                    		<button type="button" id="updatebtn" class="btn_4" onclick="location.href='jobInsertMove'">수정하기</button>
	                    	</c:when>
	                    	<c:otherwise>
			                    	<button type="button" id="heartbtn" class="btn_4" onclick="heart()">찜하기</button>
	                    			<button type="button" id="heartCancelbtn" class="btn_4" onclick="heartCancel()">찜취소</button>
	                    		<button type="button" id="callbtn" class="btn_4">신청하기</button>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <h4 class="title_top">경력 ${jobDetail.user_crr }년</h4>
	                    
	                    <div class="modaldal content">
	                        <div class="content modalcontent">
	                            <div class="justify-content-center">
	                                <h2 class="content prjtitle" style="text-align: center;">진행중인 프로젝트</h2>
	                                <p class="content prj">프로젝트</p>
	                                
	                                <div class="content form-select" id="dropdown">
	                                    <select class="content prjlist" id="pId">
	                                    	<c:forEach items="${prjList }" var="prjList">
		                                        <option value="${prjList.prj_id }">${prjList.prj_name }</option>
	                                    	</c:forEach>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
	                        <button type="button" class="btn_4 modalInbtn" onclick="requsetWork()">신청하기</button>
	                    </div>
	                    
	                    <div class="">
	                        <h4 class="title_top">보유기술</h4>
	                        <c:forEach items="${techDetail }" var="techList">
		                        <span class="btn_4">${techList.tech_name }</span>
	                        </c:forEach>
	                    </div>
	
	                    <h4 class="title_top">평점</h4>
	                    <div class="">
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
	                                
	                                <h6>상세평점</h6>
	                                
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
    <% UserVO user=(UserVO)session.getAttribute("sessionUser");%>
    $(document).ready(function(){
	    <%if(user==null)
	    {%>
	       $('#heartbtn').hide();
	       $('#heartCancelbtn').hide();
	    <%}
	    else
	    {%>
	    if("${heartCheck}" != "no") {
	    	$('#heartbtn').hide();
	    } else {
	    	$('#heartCancelbtn').hide();
	    }
	    <%}%>
    })
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
     
        function check(e)
        {
            if(!$(e.target).hasClass("content")
            		&& !$(e.target).hasClass("callbtn")
            		&& !$(e.target).hasClass("btn_4")
	                && !$(e.target).hasClass("option") 
	                && !$(e.target).hasClass("current")) {
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
        
        //찜하기 일단 보류
        /* $("#heartbtn").on("click", function() {
        	const data = {
        			user_id : '${jobDetail.user_id}'
        	}
        	
	        $ajax({
	        	url: "",
	        	type: "post",
	        	data: data,
	        });
        }) */
        function heart() {
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
    			user_id2: ${jobDetail.user_id}
    		},
    		success: function() {
    			$('#heartbtn').hide();
        		$('#heartCancelbtn').show();	
    		}
    	})
    		toastr.success('찜하기 성공!');
    	
        <%}%>;
  		}
        
        function heartCancel() {
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
        			user_id2: ${jobDetail.user_id}
        		}
        	}).done(function() {
        		toastr.success('찜하기 취소되었습니다.');
        		$('#heartbtn').show();
    			$('#heartCancelbtn').hide();
    			
        	})
        	<%}%>;
        }
        
        function requsetWork() {
        	$.ajax({
        		url: 'requestWork',
        		type: 'post', 
        		data: {
        			user_id: ${jobDetail.user_id},
        			prj_id: $("#pId").val(),
        		},
        		success: function() {
        			toastr.success('신청하기 성공!');
        		}
        	})
        }
    </script>
    
</body>
</html>