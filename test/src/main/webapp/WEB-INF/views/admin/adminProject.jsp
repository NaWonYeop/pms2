<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table-row {
	font-family: 'TmoneyRoundWindRegular';
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />
</head>
<body>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">게시판</h2>
						</div>
					</div>
					<div>
						<h4 style="float: right; color: #fff">KEROKERORI~</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact-section section_padding">
		<div class="row col-12">
			<div class="col-10" style="display: inline-block;">
				<h2>전체 프로젝트 리스트</h2>
			</div>

		</div>
		<div id="data_list_wrapper" class="dataTables_wrapper no-footer"
			style="width: 80%; margin-left: 10%">
			<table id="data_list" class="table table-bordered">
				<thead class="table-head">
					<tr>
						<th><div class="visit">프로젝트명</div></th>
						<th><div class="country">기간</div></th>
						<th><div class="visit">총 참여인원</div></th>
						<th><div class="visit">상태</div></th>
						<th><div class="visit">정산</div></th>
						<th><div class="visit">삭제</div></th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Project }" var="myp">
						<tr  id="${myp.prj_id}">
							<td><div class="visit ">${myp.prj_name }</div></td>
							<td>
								<div class="country">
									<fmt:formatDate value="${myp.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${myp.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
							</td>
							<td><div class="visit">${myp.count }명</div></td>
							<td>
							<div class="visit">
									<c:choose>
										<c:when test="${myp.prj_devEd_prop eq 0 }">
                            		진행중
                            	</c:when>
										<c:otherwise>
                            		종료
                            	</c:otherwise>
									</c:choose>
								</div></td>
							<td><div class="visit">
									<button class="money button button-contactForm btn_1"
										id="${myp.prj_id}">정산</button>
								</div></td>
							<td><div class="visit">
									<button class="button button-contactForm btn_1"
										onclick="delproject(${myp.prj_id})">삭제</button>
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


	</section>
	
	
	
	
	<div class="modal__background">
		<div class="modaldal content">
			<div class="content modalcontent">
				<div class="justify-content-center">
					<h2 class="content title" style="text-align: center;">정산</h2>
					
					<a class="content title">누적 금액</a>
					<p><a class="content " id="modaltotalwon"></a>
					<a class="content " id="modaltotalwei"></a></p>
					
					<a class="content title">오늘 정산 금액</a>
					<p><a class="content " id="modaltodaywon"></a>원
					<a class="content " id="modaltodaywei"></a>wei</p>
					
				</div>
			</div>
			<button type="button" class="btn_4 modalInbtn" onclick="request()">송금</button>
			<button type="button" class="btn_4 ">취소</button>
		
		</div>
	</div>
	
	
	
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
	var pId;
	
	function check(e)
    {
       if(!$(e.target).hasClass("content")
        		&& !$(e.target).hasClass("modalInbtn") //신청하기버튼
              && !$(e.target).hasClass("money") 
              && !$(e.target).hasClass("current")) {
            $('.modaldal').fadeOut();
            $('.modal__background').fadeOut();
          
        }
    }
    $('html').click(function(e){
        console.log(e.target);
        check(e);
    });
    $('.money').click(function(e){
        $('.modaldal').fadeIn();
        $('.modal__background').fadeIn();
        
        
        pId = $(".money").prevObject.context.activeElement.id;
		console.log("프로젝트 아이디 : "+ pId);
		
		 $.ajax({
	    		url: 'ajaxBuyData',
	    		type: 'post',
	    		data: {
	    			prj_id: pId
	    		},
	    		 success: function(res){
			     	console.log(res);
			     	$('#modaltotalwon').html(res.sumWon + " 원");
			     	$('#modaltotalwei').html(res.sumWei + " wei");
	
			          //location.reload();
			        },
			        error:function(){
			          console.log("ajax 통신 실패!!!");
			        }
				}) //ajax 
		
		
		
		
		
		
		
        
        
       /*  //코인구매
  			console.log('코인구매 클릭');
  			
  			//debugger
  			uId = document.getElementById('user_id').value;
  			console.log("구매자 아이디 : "+ uId);
  			uAc = document.getElementById('ether_id').value;
  			console.log("구매자 이더리움 어카운트 : "+ uAc);

  			rId = $(".money").prevObject.context.activeElement.id;
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
        
  			$('#modalWei').html(rPay + " wei"); */
        
 
    });
    
    
    function request() {
    	//debugger;
			console.log("구매시작");
			
			/* console.log("웨이 결제액 : "+ rPay);
			console.log(typeof cId+ "고유 거래 코드 : "+ cId);
			//debugger;
			//블록체인 접속 시작//////////////////////////////////////////////////////////////////////
			
			solidityRewardFnc.methods
			.buyAry(cId, mAc)
			.send({from: uAc, value: rPay })
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
				
	
			}); */
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
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
		function delproject(id) {
			$.ajax({
        		url: 'adminPrjDelete',
        		type: 'post', 
        		data: {
           			prj_id: id,
        		},
        		success: function() {
        			$('#'+id).remove();
        			toastr.success('삭제 되었습니다.');
        		}
        	})
		}
	  jQuery(function($) {
			$("#data_list").DataTable({
				lengthChange : false,

				// 정렬 기능 숨기기
				ordering : false,

				// 정보 표시 숨기기
				info : false,

				displayLength : 15
			});
		});
	</script>
</body>
</html>