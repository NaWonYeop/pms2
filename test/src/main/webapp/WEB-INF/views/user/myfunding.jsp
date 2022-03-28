<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.loader {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	background: rgba(0, 0, 0, 0.3);
	z-index: 99;
	text-align: center;
	z-index: 3;
}

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
        height: 20%;
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
										src="../images/${fun.ctf_st_name }"
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
									<li>구매 방법 : ${fun.buy_way }</li>
									
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
								<input type="hidden" id="bw${fun.buy_id }" value="${fun.buy_way }">
								<input type="hidden" id="r${fun.buy_id }" value="${fun.reward_id }">
								<input type="hidden" id="bc${fun.buy_id }" value="${fun.buy_count }">
								<input type="hidden" id="muID${fun.buy_id }" value="${fun.buy_muid }">
								<input type="hidden" id="stt${fun.buy_id }" value="${fun.buy_stt }">
								
								
								<div class="col-sm-12 text-center" style="padding-left: 0px;">
									<c:if test="${fun.buy_stt !='환불'}">
										<button type="button" id="${fun.buy_id }" class="rfnd button button-contactForm btn_1"
											style="width: 100%; font-family: 'MinSans-Medium';">환불</button>
									</c:if>
									<c:if test="${fun.buy_stt =='환불'}">
										<button type="button"  class="nono button button-contactForm "
											style="width: 100%; font-family: 'MinSans-Medium'; background-color: gray !important; ">환불 완료</button>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

            </div>
        </div>
    </section>
    <div class="modal__background">
		<div class="modaldal content">
			<div class="content modalcontent">
				<div class="justify-content-center">
					<h2 class="content title" style="text-align: center;">환불 확인</h2>
					<br>
					<br>
					<div class="content" style="text-align: right; margin-right: 20px;">
					<a class="content pay" id="modalPay"></a>
					</div>
				</div>
			</div>
			<br>
			<br>
			<div style="position: relative; text-align: center;">
		
			<button type="button" class="btn_4 modalInbtn" onclick="request()">환불</button>
			&nbsp;
			<button type="button" class="btn_4 ">취소</button>	
			</div>
		</div>
	</div>
	
	<input type="hidden" id="ether_id" name="ether_id" value="${sessionScope.sessionUser.ether_id }">
	
	<div class="loader" style="display: none;">
		<img src='resources/images/ethloading.gif'
			style='display: block; position: absolute; top: 40%; left: 40%; z-index: 100;' />"
	</div>
	<script type="text/javascript">
	var muId; //cId
	var uAc;
	var bId;
	var bStt;
	var bWay;
	var rId;
	var bPay; //won, wei
	var bCnt;
	
	function check(e)
    {
       if(!$(e.target).hasClass("content")
        		&& !$(e.target).hasClass("modalInbtn") //신청하기버튼
              && !$(e.target).hasClass("rfnd") 
              && !$(e.target).hasClass("current")) {
            $('.modaldal').fadeOut();
            $('.modal__background').fadeOut();
            $('#modalPay').html();
          
        }
    }
    $('html').click(function(e){
        console.log(e.target);
        check(e);
    });
    $('.rfnd').click(function(e){
    $('.modaldal').fadeIn();
    $('.modal__background').fadeIn();
        
        //환불 클릭
  			console.log('환불 클릭');
  			
       
        
  			uAc = document.getElementById('ether_id').value;
  			console.log("구매자 이더리움 어카운트 : "+ uAc);
  			bId = $(".rfnd").prevObject.context.activeElement.id;
  			console.log("구매 아이디 : "+ bId);
  			muId = document.getElementById('muID'+bId).value;
  			console.log("구매 코드 : "+ muId);
  			bStt = document.getElementById('stt'+bId).value;
  			console.log("구매 상태 : "+ bStt);
  	  		rId = document.getElementById('r'+bId).value;
  	  		console.log("리워드 아이디 : "+ rId);
  	  		bCnt = document.getElementById('bc'+bId).value;
  	  		console.log("구매 수량 : "+ bCnt);
  			bWay = document.getElementById('bw'+bId).value;
  	  		console.log("구매 방법 : "+ bWay);
  	  		
  	  		if(bWay == 'cash'){
	  	  		bPay = document.getElementById('pay'+bId).textContent;
	  	  		console.log("원화 가격 : "+ bPay);
	  	  		
	  			$('#modalPay').html(bPay + " 원");
  	  			
  	  		} else {
	  	  		bPay = document.getElementById('pay'+bId).textContent;
	  	  		console.log("웨이 가격 : "+ bPay);
	  	  		
	  			$('#modalPay').html(bPay + " wei");
  	  		}
  	  		

 
    });
    
    $('.nono').click(function(e){
    	toastr.error("이미 환불한건 입니다.");
    })
    function request() {
    	//debugger;
			console.log("환불시작");
			
			if(bWay == 'cash'){
			//현금 환불시
			console.log("현금 환불 시");
			
			var save ={
					"buy_id" : bId,
					"buy_stt" : "환불",
					"reward_id" : rId,
					"buy_count" : bCnt,
					"buy_rfnd_won" : bPay,
					"buy_rfnd_wei" : 0,
						
				}
			
				
			 $.ajax({
				url : 'ajaxRFnd', 
		        type :'POST',
		        data : JSON.stringify(save,
		        		['buy_id','buy_stt', 'reward_id', 
		        		'buy_count', 'buy_rfnd_won', 'buy_rfnd_wei']),
		        contentType:'application/json;charset=utf-8',
		        dataType: 'json', //서버에서 보내줄 데이터 타입
		        success: function(res){
		        			        	
		          if(res == 1){
					 console.log("환불");	
			           
		          }else{
		             console.log("환불 Fail!!!");
		          } 
		          
		          location.reload();
		        },
		        error:function(){
		          console.log("환불 ajax 통신 실패!!!");
		        }
			}) //ajax  
			
			
			
			
			} else {
			//코인 환불시
			console.log("코인 환불 시");	
			
			//로딩창 킴
			$("div.loader").css("display","block");
			
			//블록체인 접속 시작//////////////////////////////////////////////////////////////////////
			solidityRewardFnc.methods
			.refund(muId)
			.send({from: account, })
			.then(function(result){
				
				console.log(result);
			
			
				var save ={
						"buy_id" : bId,
						"buy_stt" : "환불",
						"reward_id" : rId,
						"buy_count" : bCnt,
						"buy_rfnd_won" : 0,
						"buy_rfnd_wei" : bPay,
							
					}
				
					
				 $.ajax({
					url : 'ajaxRFnd', 
			        type :'POST',
			        data : JSON.stringify(save,
			        		['buy_id','buy_stt', 'reward_id', 
			        		'buy_count', 'buy_rfnd_won', 'buy_rfnd_wei']),
			        contentType:'application/json;charset=utf-8',
			        dataType: 'json', //서버에서 보내줄 데이터 타입
			        success: function(res){
			        			        	
			          if(res == 1){
						 console.log("환불");	
				           
			          }else{
			             console.log("환불 Fail!!!");
			          } 
			          
			          location.reload();
			        },
			        error:function(){
			          console.log("환불 ajax 통신 실패!!!");
			        }
				}) //ajax  
				
	
			}); 
			
			
			}
			
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
	
	
	
	
	
	</script>
    
 <script src="resources/main/js/jquery.counterup.min.js"></script>
<script src="resources/main/js/custom.js"></script>
   
</body>
</html>