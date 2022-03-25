<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<!-- 페이지 새로고침 명령어 -->
<!-- <META HTTP-EQUIV="refresh" CONTENT="3"> -->
<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script> 
<script src="resources/js/rewardFnc.js"></script>
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
        
        /* 모달창의 배경을 만든다 */
		.modal__background{
		  display:none;
		  position: fixed;
		  top:0; left: 0; bottom: 0; right: 0;
		  background: rgba(0, 0, 0, 0.3);
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

        .heartbtn, .updatebtn {
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
							<h2 style="float: right;">프로젝트 상세페이지</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">KEROKERORI~</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
${project}<br>
 ${sessionScope } 
 	<section class="course_details_area section_padding">
        <div class="container">
        	<input type="hidden" id="prj_id" name="prj_id" value="${project.prj_id}">
        	<div class="col-12 Tname">
	            <h4 class="title_top" style="font-size: 50px; margin-bottom: 40px;">${project.prj_name}</h4>
	            조회수 : ${project.prj_hit}<br>
				등록일 : <fmt:formatDate value="${project.prj_reg_date }" pattern="yyyy-MM-dd" /><br>
				담당자 아이디 : ${project.master_id}<br>
				시작일 ~ 마감일 : 
				<fmt:formatDate value="${project.prj_str }" pattern="yyyy-MM-dd" /> ~ 
				<fmt:formatDate value="${project.prj_ed }" pattern="yyyy-MM-dd" /><br>
	        </div>
	            <c:if test="${project.prj_fnd_prop == 1}">
				<!-- 펀딩 있을시 -->
	         	<div id="sise">
	         	현금구입 달러시세 : 가져오는중<br>
	         	1이더 달러시세 : 가져오는중<br>
	         	1이더 원화시세 : 가져오는중<br>
	         	</div>
	         	<input type="hidden" id="dol">
	         	<input type="hidden" id="etherDol">
	         	<input type="hidden" id="etherWon">
        		</c:if>
        	<div class="row">
        		<div class="col-lg-8 course_details_left">
        		 	<div class="content_wrapper">
        		 	
        		 			<c:if test="${project.prj_ofr_prop == 1}">
		                    <!-- 구인 있을시 -->
		                        <h3 style="font-weight: bold;">구인</h3>
		                        <p class="btn_4">${project.prj_ar}</p>
			                    <p class="btn_4">${project.prj_cnd}</p>
								<br>
								
		                         <ul class="blog-info-link">
		                           <li><i class="far fa-user"></i> 프론트 ${ofr.total_team_prs }/ ${project.prj_frn_prs }명</a></li>
		                           <li><i class="far fa-user"></i> 백 ${ofr.total_team_prs }/ ${project.prj_bk_prs }명</a></li>
		                           <li><i class="far fa-user"></i> DB ${ofr.total_team_prs }/ ${project.prj_db_prs }명</a></li>
		                           <li><i class="far fa-user"></i> 서버 ${ofr.total_team_prs }/ ${project.prj_ser_prs }명</a></li>
		                           <li><i class="far fa-comments"></i> 모집 기간
		                            <fmt:formatDate value="${project.prj_ofr_str }" pattern="yyyy-MM-dd" /> ~ 
									<fmt:formatDate value="${project.prj_ofr_ed }" pattern="yyyy-MM-dd" /></li>
		                        </ul> 
		                        <sec:authorize access="isAuthenticated()">
				                    <form id="ajaxAppPrjInsertForm" onsubmit="return false" onclick="ajaxAppPrjInsertForm()">
										<input type="hidden" name="prj_id" value="${project.prj_id}">
										<input type="hidden" name="master_id" value="${project.master_id}">
		                         		<input type="hidden" name="user_id" value="${sessionScope.sessionUser.user_id }">
										<input type="submit" class=" btn_4" value="참가신청">
									</form>
									<button type="button" id="heartbtn" class="btn_4"  style="background-color: #F27457;" onclick="heart()">찜하기</button>
	                    			<button type="button" id="heartCancelbtn" class="btn_4"  style="background-color: #F27457;" onclick="heartCancel()">찜취소</button>
								</sec:authorize>		
	                        </c:if>
        		 	
	                        
	                         <c:if test="${project.prj_fnd_prop == 1}">
							<!-- 펀딩 있을시 -->
							<h3 style="font-weight: bold;">펀딩</h3>
							<a class="d-inline-block" href="single-blog.html"> </a>
	                        <h3 class="right">
	                        <fmt:formatNumber value="${project.total_sum/(project.prj_gl_prc*1000)*100 }" pattern="00"/>%</h3>
	                        <div class="col-12">
		                        <div 
		                        <c:if test="${project.prj_ofr_prop == 0}">
		                        class="col-6"
		                        </c:if>
		                        >
			                        <div class="progress">
			                           <div class="progress-bar color-3" role="progressbar"
			                              style="width: <fmt:formatNumber value="${project.total_sum/(project.prj_gl_prc*1000)*100 }" pattern="00"/>%;background-color: #f09359" 
			                              aria-valuenow="80" 
			                              aria-valuemin="0"
			                              aria-valuemax="100">
			                            </div>
			                        </div>
			                     </div>
				            </div>
	                        <br>
	                        <ul class="blog-info-link">
	                           <li>
		                           <i class="far fa-comments"></i> 
		                           	현재 펀딩금액
	                           </li>
	                           <li><i class="far fa-comments"></i> 펀딩 기간
	                            <fmt:formatDate value="${project.prj_fnd_str }" pattern="yyyy-MM-dd" /> ~ 
								<fmt:formatDate value="${project.prj_fnd_ed }" pattern="yyyy-MM-dd" /></li>
	                         
	                           <li> 
		                           <h3 stlye="font-weight: bold;"> 
		                           <div class="single_member_counter">
		                           <span class="counter" style="font-size:25px;">${Integer.parseInt(String.valueOf(Math.round(project.total_sum/10)))},0</span>원 
		                           </div>
		                           </h3>
	                           </li>
	                        </ul>	
							(나중에 삭제)목표금액 : ${project.prj_gl_prc}만원<br>
							
							</c:if>
	                        
	                        <br>
	                        
	           
        			</div>
        			<br>
        			<c:if test="${project.prj_cnt != null}">
	        			<div id="list">
							<h3 style="font-weight: bold;">기획안</h3>
							
							${project.prj_cnt}
						</div>
        			</c:if>
        			<c:if test="${sessionScope.sessionUser.user_id == project.master_id }">
			
						<form action="projectVerUpForm">
							<input type="hidden" name="prj_id" value="${project.prj_id}">
							<input type="submit" class="rfnd btn_4" value="수정">
						</form>
					
						<form action="rewardInsertForm">
							<input type="hidden" name="prj_id" value="${project.prj_id}">
							<input type="hidden" name="master_id" value="${project.master_id}">
							<input type="hidden" id="go" name="go" value="selectPage">
							<input type="submit" class="rfnd btn_4" value="리워드 관리">
						</form>
							
						<form action="projectViewDel">
							<input type="hidden" name="prj_id" value="${project.prj_id}">
							<input type="submit" class="rfnd btn_4" value="삭제">
						</form>
					
					</c:if>
		        			
        		</div>
        		
        		<input type="hidden" id="buyMaxCoinCount" name="buyMaxCoinCount" value="${buyMaxCoinCount }">
        		<input type="hidden" id="user_id" name="user_id" value="${sessionScope.sessionUser.user_id }">
        		<input type="hidden" id="user_name" name="user_name" value="${sessionScope.sessionUser.user_name }">
        		<input type="hidden" id="user_email" name="user_email" value="${sessionScope.sessionUser.user_email }">
        		<input type="hidden" id="user_tel" name="user_tel" value="${sessionScope.sessionUser.user_tel }">
        		<input type="hidden" id="ether_id" name="ether_id" value="${sessionScope.sessionUser.ether_id }">
        		<input type="hidden" id="master_id" name="master_id" value="${project.master_id}">
        		<input type="hidden" id="masterAcc" value="${masterAcc}">
        		
        		<div class="col-lg-4 right-contents">
        			<c:if test="${rewards != null}">
        			
        		 	<h3 style="font-weight: bold;">리워드 리스트</h3>
        			</c:if>
        			<c:forEach items="${rewards }" var="reward">
	        			<form>
		        			<article class="blog_item">
		        				<div class="blog_details">
		        				<!-- 이거 아이디 값으로 찾는거 라 딴건 바꿔도 괜찮아요-->
		                           	<h3 id="n${reward.reward_id }">${reward.rwd_name}</h3>
		                           	원화<h2 id="p${reward.reward_id }">${reward.rwd_prc}</h2>
									ETHER<h2>${ String.format("%.6f",(reward.rwd_prc / Rether))}</h2>
									<input type="hidden" id="e${reward.reward_id }" value="${reward.rwd_prc / Rether}">
									내용 : ${reward.rwd_cnt}<br>
									구입수량 : ${reward.rwd_cot}<br>
									판매수량 : ${reward.rwd_goal}<br>
									(나중에 삭제할것)판매 여부 : ${reward.rwd_stt}<br>
									<input type="number" id="c${reward.reward_id }" name="buy_count" required placeholder="구매수량(기본:1개)">
									<div class ="btns">
									<!-- 버튼들은 클래스 바꾸면 안되요 -->
										<input type="hidden" name="reward_id" value="${reward.reward_id }">
										<input type="button" class="wBuy btn_4" id="${reward.reward_id }" value="현금구매"  style="background-color: #F27457;">
										<input type="button" class="rfnd btn_4" id="${reward.reward_id }" value="코인구매"  style="background-color: #F27457;">
									</div>
		        				</div>
		        			</article>
	        			</form>
					</c:forEach>
        		</div>
        	</div>
		</div>
	</section>
	<div class="modal__background">
		<div class="modaldal content">
			<div class="content modalcontent">
				<div class="justify-content-center">
					<h2 class="content title" style="text-align: center;">결제금액 단위(wei)</h2>
					<a class="content wei" id="modalWei"></a>
				</div>
			</div>
			<button type="button" class="btn_4 modalInbtn" onclick="request()">결제</button>
			<button type="button" class="btn_4 ">취소</button>
		
		</div>
	</div>


	<script type="text/javascript">
	var uId;
	var uAc;
	var rId;
	var rEPrc;
	var rWPrc;
	var rCnt;
	var pId;
	var rPay;
	var today;
	var mId;
	var mAc;
	var cId;
	var uName;
	var uEmail;
	var uTel;
	var rId;
	var rName;
	var rPrc;
	var buyMaxCoinCount;
	
	function check(e)
      {
         if(!$(e.target).hasClass("content")
          		&& !$(e.target).hasClass("modalInbtn") //신청하기버튼
                && !$(e.target).hasClass("rfnd") 
                && !$(e.target).hasClass("current")) {
              $('.modaldal').fadeOut();
              $('.modal__background').fadeOut();
            
          }
      }
      $('html').click(function(e){
          console.log(e.target);
          check(e);
      });
      $('.rfnd').click(function(e){
          $('.modaldal').fadeIn();
          $('.modal__background').fadeIn();
          
          //코인구매
    			console.log('코인구매 클릭');
    			
    			//debugger
    			uId = document.getElementById('user_id').value;
    			console.log("구매자 아이디 : "+ uId);
    			uAc = document.getElementById('ether_id').value;
    			console.log("구매자 이더리움 어카운트 : "+ uAc);

    			rId = $(".rfnd").prevObject.context.activeElement.id;
    			console.log("리워드 아이디 : "+ rId);
    			//var rName = document.getElementById('n'+rId).innerHTML;
    			//console.log("리워드 이름 : "+ rName);
    			rEPrc = document.getElementById('e'+rId).value;
    			console.log("리워드 이더 금액 : "+ rEPrc);
    			rWPrc = rEPrc * (10**18);
    			console.log("리워드 웨이 금액 : "+ rWPrc);
    			rCnt = document.getElementById('c'+rId).value;
    			if (!document.getElementById('c'+rId).checkValidity()) {
    				 console.log("기본값 1 넣는곳");
    				 rCnt = 1;
    			}
    			console.log("리워드 구매수 : "+ rCnt);
    			
    			pId = document.getElementById('prj_id').value;
    			console.log("프로젝트 아이디 : "+ pId);
    			
    			rPay = parseInt(parseInt(rCnt) * rWPrc);
    			console.log("웨이 결제액 : "+ rPay);
    			
    			today = getToday();
    			console.log("오늘 년월일 : "+ today);
    			
    			mId = document.getElementById('master_id').value;
    			console.log("담당자 아이디 : "+ mId);
    			
    			
    			mAc = document.getElementById('masterAcc').value;
    			console.log("담당자 어카운트 : "+ mAc);
    			
    			buyMaxCoinCount = document.getElementById('buyMaxCoinCount').value;
    			console.log("buyMaxCoinCount : "+ buyMaxCoinCount);
    			
    			cId = parseInt(mId + buyMaxCoinCount + today ) ;
    			console.log(typeof cId+ "고유 거래 코드 : "+ cId);
          
    			$('#modalWei').html(rPay + " wei");
          
   
      });
      
      
      function request() {
      	//debugger;
  			console.log("구매시작");
  			
  			console.log("웨이 결제액 : "+ rPay);
  			console.log(typeof cId+ "고유 거래 코드 : "+ cId);
  			//debugger;
  			//블록체인 접속 시작//////////////////////////////////////////////////////////////////////
  			
  			solidityRewardFnc.methods
  			.buyAry(cId, account)
  			.send({from: account, value: rPay })
  			.then(function(result){
  				
  				console.log(result);
  			
  			
  			 	//데이터 저장시 필요한 데이터
  				var save ={
						"user_id" : uId,
						"buy_way" : "coin",
						"reward_id" : rId,
						"prj_id" : pId,
						"buy_count" : rCnt,
						"buy_won" : 0,
						"buy_wei" : rPay,
						"buy_muid" : cId
							
					}
					
					
				 $.ajax({
					url : 'ajaxBuy', 
			        type :'POST',
			        data : JSON.stringify(save,
			        		['user_id', 'buy_way', 'reward_id', 
			        		'prj_id', 'buy_count', 'buy_won',
			        		'buy_wei', 'buy_muid']),
			        contentType:'application/json;charset=utf-8',
			        dataType: 'json', //서버에서 보내줄 데이터 타입
  			        success: function(res){
  			        			        	
  			          if(res == 1){
  						 console.log("추가성공");	
  				           
  			          }else{
  			             console.log("Insert Fail!!!");
  			          } 
  			          
  			          location.reload();
  			        },
  			        error:function(){
  			          console.log("Insert ajax 통신 실패!!!");
  			        }
  				}) //ajax 
  				
  	
  			});
		}
      
	 toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": true,
			  "positionClass": "toast-top-center",
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
/* 	$("#dCoin").click(function(e){
		console.log("가니?")
		var won = 50000;
		 $.ajax({
				url : 'ajaxCoin', 
		        type :'POST',
		        data: {
		        	"won" : won
		        },
		        success: function(result){
		        			        	
					console.log(result);
					$("#howMuchEther").val(result);
					
					
				},
		        error:function(){
		          console.log("Insert ajax 통신 실패!!!");
		        }
			}) //ajax
		
	}); */
	
	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + month + day;
	}
	
	
	function ajaxAppPrjInsertForm() {
		console.log("참가신청한다");
		
		$.ajax({
			type : 'GET',
			url : "ajaxAppPrjInsertForm",
			data : $("#ajaxAppPrjInsertForm").serialize(),
			dataTyep: "json",
			success : function (result) {
				if(result == 0)
					toastr.success('신청했습니다.');
				else
					toastr.warning('이미신청했거나 신청받은 기록이 있습니다.');
			},
	        error:function(){
		          console.log("Insert ajax 통신 실패!!!");
		    }
		});
	}
	
	
	$(document).ready(function(){
		   	//아임포트 준비
			var IMP = window.IMP;
			var code = "imp48219552"; //가맹점 식별코드
			IMP.init(code);
			
			//시세
			$.ajax({
				url : 'ajaxSise', 
				type: 'get',
	              data: {
	            	 user_id: ${sessionUser.user_id},
	                 master_id: ${project.master_id}
	                	 
	              },
		        success: function(result){
		        			        	
					console.log(result);
					var dol = result.dol;
					var etherDol = result.etherDol;
					var etherWon = result.etherWon;
					var bmccount = result.buyMaxCoinCount;
					console.log("현금구입 달러시세 : " + dol);
					console.log("1이더 달러시세 : " + etherDol);
					console.log("1이더 원화시세 : " + etherWon);
					console.log("buyMaxCoinCount : " + bmccount);
					$("#buyMaxCoinCount").val(bmccount);
					$("#dol").val(dol);
					$("#etherDol").val(etherDol);
					$("#etherWon").val(etherWon);
					//클래스는 배열이니 클래스 선언후 foreach 나 for문으로 돌려서
					// 값 넣어 실시간 코인가격 연동하여 보여주기
					
					//금액 인풋에 넣고 난뒤에 String 으로 바꿔 단위 , 넣어주기
					
					$("#sise").html("현금구입 달러시세 : " + dol+"<br>"
							+"1이더 달러시세 : " + etherDol+"<br>"
							+"1이더 원화시세 : " + etherWon+"<br>");
		        },
		        error:function(){
		          console.log("Insert ajax 통신 실패!!!");
		        }
			}) //ajax

		}); //doc.ready
	
		//현금 구매
		$(".wBuy").click(function(e){
			console.log('현금구매 클릭');
			
			//debugger
			 uId = document.getElementById('user_id').value;
			console.log("구매자 아이디 : "+ uId);
			 uName = document.getElementById('user_name').value;
			console.log("구매자 이름 : "+ uName);
			 uEmail = document.getElementById('user_email').value;
			console.log("구매자 메일 : "+ uEmail);
			 uTel = document.getElementById('user_tel').value;
			console.log("구매자 연락처 : "+ uTel);
			
			 rId = $(".wBuy").prevObject.context.activeElement.id;
			console.log("리워드 아이디 : "+ rId);
			 rName = document.getElementById('n'+rId).innerHTML;
			console.log("리워드 이름 : "+ rName);
			 rPrc = document.getElementById('p'+rId).innerHTML;
			console.log("리워드 금액 : "+ rPrc);
			 rCnt = document.getElementById('c'+rId).value;
			if (!document.getElementById('c'+rId).checkValidity()) {
				 console.log("기본값 1 넣는곳");
				 rCnt = 1;
			}
			console.log("리워드 구매수 : "+ rCnt);
			
			 pId = document.getElementById('prj_id').value;
			console.log("프로젝트 아이디 : "+ pId);
			
			
			 rPay = parseInt(rCnt) * parseInt(rPrc);
			console.log("결제액 : "+ rPay);
			

			
			//debugger;
			console.log("구매시작");
			//결제요청
			IMP.request_pay({
				//name과 amout만있어도 결제 진행가능
				//pg : 'kakao', //pg사 선택 (kakao, kakaopay 둘다 가능)
				pg: "html5_inicis",
				pay_method: 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : rName, // 상품명
				amount : rPay,
				buyer_email : uEmail,
				buyer_name : uName,
				buyer_tel : uTel,  //필수항목
				//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
				//m_redirect_url : 'https://localhost:8080/payments/complete'
			}, function(rsp){
				if(rsp.success){//결제 성공시
					var msg = '결제가 완료되었습니다';
					
					//나중에 지울것
					/*
					var result = {
					"imp_uid" : rsp.imp_uid, //고유ID
					"merchant_uid" : rsp.merchant_uid, //상점 거래ID ~환불시 필요
					"biz_email" : uEmail, 
					"pay_date" : new Date().getTime(), 
					"amount" : rsp.paid_amount, //결제금액
					"card_no" : rsp.apply_num, //카드 승인번호
					"refund" : 'payed'
					}
					console.log("결제성공 : " + msg);
					console.log("고유ID : " + rsp.imp_uid);
					console.log("상점 거래ID : " + rsp.merchant_uid);
					console.log("이메일 : " + uEmail);
					console.log("결제일 : " + new Date().getTime());
					console.log("결제금액 : " + rsp.paid_amount);
					console.log("카드 승인번호 : " + rsp.apply_num);
					*/
					//데이터 저장시 필요한 데이터
					var save ={
						"user_id" : uId,
						"buy_way" : "cash",
						"reward_id" : rId,
						"prj_id" : pId,
						"buy_count" : rCnt,
						"buy_won" : rPay,
						"buy_wei" : 0,
						"buy_muid" : rsp.merchant_uid
							
					}
					
					
					 $.ajax({
						url : 'ajaxBuy', 
				        type :'POST',
				        data : JSON.stringify(save,
				        		['user_id', 'buy_way', 'reward_id', 
				        		'prj_id', 'buy_count', 'buy_won',
				        		'buy_wei', 'buy_muid']),
				        contentType:'application/json;charset=utf-8',
				        dataType: 'json', //서버에서 보내줄 데이터 타입
				        success: function(res){
				        			        	
				          if(res == 1){
							 console.log("추가성공");	
							 //pay += 5;
							 //$('#pay_coupon').html(pay);			           
				          }else{
				             console.log("Insert Fail!!!");
				          } 
				          
				          location.reload();
				        },
				        error:function(){
				          console.log("Insert ajax 통신 실패!!!");
				        }
					}) //ajax
					
				}
				else{//결제 실패시
					var msg = '결제에 실패했습니다';
					msg += '에러 : ' + rsp.error_msg
				}
				console.log(msg);
			});//pay
		}); //check1 클릭 이벤트
		 
/* 		
		
		//환불은 다른데서 사용할것
		$("#check2").click(function(e){
		      console.log("남은이용권"+$('#pay_coupon').text());
		      if($('#pay_coupon').text() >= 5){
			$.ajax({
					url: "/samsam/coupon_cancel.do",
					type:"post",
					//datatype:"json",
					contentType : 'application/x-www-form-urlencoded; charset = utf-8',
					data : {
						"biz_email" : '' // 주문번호
						//"cancle_request_amount" : 2000, //환불금액
						//"reason": "테스트 결제 환불", //환불사유
						//"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
						//"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
						//"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
					}
				}).done(function(result){ //환불 성공
					 pay -= 5;
					 $('#pay_coupon').html(pay);	
					console.log("환불 성공 : "+ result);
				}).fail(function(error){
					console.log("환불 실패 : "+ error);
				});//ajax
			} else{
				console.log("환불 실패 : 남은 결제권 환불 불가");
			}
		}); //check2 클릭 */
		function heart() {
	       
	        $.ajax({
	    		url: 'heartProjectInsert',
	    		type: 'post',
	    		data: {
	    			user_id: ${sessionUser.user_id},
	    			prj_id: ${project.prj_id}
	    		},
	    		success: function() {
	    			$('#heartbtn').hide();
	        		$('#heartCancelbtn').show();	
	    		}
	    	})
	    		toastr.success('찜하기 성공!');
	    	
	      
	  		}
	        
	        function heartCancel() {
	   
	  
	        	$.ajax({
	        		url: 'heartProjectDelete',
	        		type: 'post',
	        		data: {
	        			user_id: ${sessionUser.user_id},
	        			prj_id: ${project.prj_id}
	        		}
	        	}).done(function() {
	        		toastr.success('찜하기 취소되었습니다.');
	        		$('#heartbtn').show();
	    			$('#heartCancelbtn').hide();
	    			
	        	})
	  
	        }
	        if("${heartCheck}" != "no") {
		    	$('#heartbtn').hide();
		    } else {
		    	$('#heartCancelbtn').hide();
		    }
	</script>
	<script src="resources/main/js/jquery.counterup.min.js"></script>
<script src="resources/main/js/custom.js"></script>
</body>
</html>