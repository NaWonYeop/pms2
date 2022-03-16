<%@page import="co.test.prj.user.service.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.col-sm-6, .col-xl-3 {
   margin-top: 30px;
}

.modaldal {
   display: none;
   width: 30%;
   height: 60%;
   border-radius: 30px;
   background-color: #fff;
   border: 3px solid #798BF2;
   position: fixed;
   top: 50%;
   left: 50%;
   -webkit-transform: translate(-50%, -50%);
   -moz-transform: translate(-50%, -50%);
   -ms-transform: translate(-50%, -50%);
   -o-transform: translate(-50%, -50%);
   transform: translate(-50%, -50%);
   z-index: 10;
}

.modalcontent {
   margin-top: 10%;
   height: 90%;
}

.prjtitle {
   font-size: xx-large;
}

.prjlist {
   width: 300px;
   text-align: center;
}

.prj {
   text-align: left;
   margin-left: 4%;
   height: 20px;
}

.score {
   width: 50%;
   height: 30px;
   margin-right: 4%;
}

.flexbox {
   margin-left: 8%;
   margin-right: 8%;
   margin-top: 5%;
   border-radius: 15px;
   display: flex;
   -webkit-justify-content: space-between;
   justify-content: space-between;
}

.call {
   width: 80%;
   height: 10%;
   border-radius: 10px;
   margin-top: 10%;
   text-align: center;
}

.default-select .current{
    -webkit-tap-highlight-color: transparent !important;
    
    border-radius: 5px !important;
    border: #f9f9ff !important;
    box-sizing: border-box !important;
    clear: both !important;
    cursor: pointer !important;
    display: block !important;
    float: left !important;
    font-family: inherit !important;
    font-size: 14px !important;
    font-weight: normal !important;
    height: 38px !important;
    line-height: 40px !important;
    outline: none !important;
    padding-left: 18px !important;
    padding-right: 30px !important;
    position: relative !important;
    text-align: left !important;
    -webkit-transition: all 0.2s ease-in-out !important;
    transition: all 0.2s ease-in-out !important;
    -webkit-user-select: none !important;
    -moz-user-select: none !important;
    -ms-user-select: none !important;
    user-select: none !important;
    white-space: nowrap !important;
    width: auto !important;
    background: #f9f9ff !important;
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
							<h2 style="float: right;">평가하기</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">KEROKERORI~</h4>
						</div>
				</div>
			</div>
		</div>
	</section>

   <section class="feature_part" style="padding-top: 0; padding-bottom: 5%;">
      <div class="container">
         <div class="row">

            <div class="col-sm-6 col-xl-3 align-self-center">
               <div class="single_feature_text" style="text-align: center;">
                  <h2>평가하기</h2>
                  <p>${AssessList[0].prj_name }</p>
               </div>
            </div>

            <c:forEach items="${AssessList }" var="Assess" varStatus="status">
            	<c:if test="${sessionUser.user_id != Assess.user_id }">
               <div class="col-sm-6 col-xl-3">
                  <div class="single_feature">
                     <div class="single_feature_part">
                        <span id="ti-layers${status.index }" class="single_feature_icon" onclick="modalFadeSelect(this);" style="position: static;">
                           <i id="ti-layers${status.index }" class="ti-layers"></i>
                           
	                           <div class="modaldal content">
	                              <input type="hidden" id="aId${Assess.user_id }" value="${Assess.user_id }">
	                              <div class="content modalcontent">
	                                 <div class="justify-content-center">
	                                    <h2 class="content prjtitle" style="text-align: center;">${Assess.user_name }</h2>
	                                    <div class="flexbox">
	                                       <p class="content prj" style="">전문성</p>
	                                       <div class="default-select" id="default-select">
	                                                   <select id="str_prfsn${Assess.user_id }">
	                                                      <option value="5">5</option>
	                                                      <option value="4">4</option>
	                                                      <option value="3">3</option>
	                                                      <option value="2">2</option>
	                                                      <option value="1">1</option>
	                                                   </select>
	                                                </div>
	                                    </div>
	                                    <div class="flexbox">
	                                       <p class="content prj">일정준수</p>
	                                       <div class="default-select" id="default-select">
	                                                   <select id="str_obs${Assess.user_id }">
	                                                      <option value="5">5</option>
	                                                      <option value="4">4</option>
	                                                      <option value="3">3</option>
	                                                      <option value="2">2</option>
	                                                      <option value="1">1</option>
	                                                   </select>
	                                                </div>
	                                    </div>
	                                    <div class="flexbox">
	                                       <p class="content prj">적극성</p>
	                                       <div class="default-select" id="default-select">
	                                                   <select id="str_pos${Assess.user_id }">
	                                                      <option value="5">5</option>
	                                                      <option value="4">4</option>
	                                                      <option value="3">3</option>
	                                                      <option value="2">2</option>
	                                                      <option value="1">1</option>
	                                                   </select>
	                                                </div>
	                                    </div>
	                                    <div class="flexbox">
	                                       <p class="content prj">의사소통</p>
	                                       <div class="default-select" id="default-select">
	                                                   <select id="str_comm${Assess.user_id }">
	                                                      <option value="5">5</option>
	                                                      <option value="4">4</option>
	                                                      <option value="3">3</option>
	                                                      <option value="2">2</option>
	                                                      <option value="1">1</option>
	                                                   </select>
	                                                </div>
	                                    </div>
	                                    <div class="flexbox">
	                                       <p class="content prj">재고용 의사</p>
	                                       <div class="default-select" id="default-select">
	                                                   <select id="str_re_empl${Assess.user_id }">
	                                                      <option value="5">5</option>
	                                                      <option value="4">4</option>
	                                                      <option value="3">3</option>
	                                                      <option value="2">2</option>
	                                                      <option value="1">1</option>
	                                                   </select>
	                                                </div>
	                                    </div>
	                                 </div>
	                                 <c:if test="${Assess.str_result eq 0  }">
	                                 <button type="button" class="call btn_4" id="insert${Assess.user_id }"
	                                    style="line-height: normal;" onclick="Assess(${Assess.user_id },0)">평가하기</button>
			                         </c:if>
			                         <c:if test="${Assess.str_result eq 1  }">
	                                 <button type="button" class="call btn_4" id="update"
	                                    style="line-height: normal;" onclick="Assess(${Assess.user_id },1)">평가하기</button>
			                         </c:if>
	                              </div>
	                           </div>
                        </span>
                        <h4>${Assess.user_name }</h4>
                        <p>${Assess.tm_dept }</p>
                        <c:choose>
                        	<c:when test="${Assess.str_result eq 1 }">
                        		<h3 id="success">평가완료</h3>	
                        	</c:when>
                        	<c:otherwise>
                        		<h3 id="error${Assess.user_id }">평가 미완료</h3>
                        	</c:otherwise>
                        </c:choose>
                        
                     </div>
                  </div>
               </div>
               </c:if>
            </c:forEach>


         </div>
      </div>
   </section>

   <script>
      function check(e) {
         if (!$(e.target).hasClass("content")
               && !$(e.target).hasClass("default-select")
               && !$(e.target).hasClass("nice-select")
               && !$(e.target).hasClass("justify-content-center")
               && !$(e.target).hasClass("flexbox")
               && !$(e.target).hasClass("ti-layers")
               && !$(e.target).hasClass("option")
               && !$(e.target).hasClass("current")
               && !$(e.target).hasClass("single_feature_icon")) {
            $('.modaldal').fadeOut();
         }
      }

      $('html').click(function(e) {
         console.log(e.target);
         check(e);
      });

      /*    $('#ti-layers').click(function(e) {
            $('.modaldal').fadeIn();
         }); */

      function modalFadeSelect(info) {
        	 console.log('#' + info.id);
         $('#' + info.id).children('.modaldal').fadeIn();
      }
      
      //평가 버튼
      function Assess(e,ch) {
    	 var url;
    	 if(ch==0)	{
    		 url= 'projectAssess';
    	} else {
    		url= 'projectAssessUpdate';
    	}
    	 
         var aId = $("#aId"+e).val();
         var prfsn = parseInt($("#str_prfsn"+e+" option:selected").val()); 
         var obs = parseInt($("#str_obs"+e+" option:selected").val());
         var pos = parseInt($("#str_pos"+e+" option:selected").val());
         var comm = parseInt($("#str_comm"+e+" option:selected").val());
         var reEmpl = parseInt($("#str_re_empl"+e+" option:selected").val());
         var avg = (prfsn+obs+pos+comm+reEmpl)/5;
         
         $.ajax({
            url : url,
            type: "get",
            data : {
               prj_id: ${AssessList[0].prj_id },
               user_id: aId,
               str_prfsn : prfsn,
               str_obs : obs,
               str_pos : pos,
               str_comm : comm,
               str_re_empl : reEmpl,
               str_avg: avg
            }
         }).done(function(){
            toastr.success("평가 성공!");
         }) 
          if(ch==0)	{
        	  console.log('aaaaaaaaa');
        	  $('#insert'+e).removeAttr('onclick');
        	  $('#insert'+e).attr("onclick", "Assess("+e+",1)");
        	  
        	  $('#error'+e).text("평가완료");
        	  
          }
      }
   </script>
</body>
</html>