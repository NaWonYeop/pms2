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

.table-row {
	font-family: 'TmoneyRoundWindRegular';
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
.modal__background {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.3);
	z-index: 2
}
</style>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" />
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="resources/js/rewardFnc.js"></script>
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
						<th><div class="visit">상태</div></th>
						<th><div class="visit">정산</div></th>
						<th><div class="visit">삭제</div></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Project }" var="myp">
						<tr id="${myp.prj_id}">
							<td><div class="visit ">${myp.prj_name }</div></td>
							<td>
								<div class="country">
									<fmt:formatDate value="${myp.prj_str }" pattern="yyyy/MM/dd" />
									~
									<fmt:formatDate value="${myp.prj_ed }" pattern="yyyy/MM/dd" />
								</div>
							</td>
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
								</div>
							</td>
							<td><div class="visit">
									<c:if test="${myp.admincount != 0}">
										<button class="money button button-contactForm btn_1"
											id="${myp.prj_id}">정산</button>
									</c:if>

									<c:if test="${myp.admincount == 0}">
										<button class="nono button button-contactForm "
											style="background-color: gray;" id="${myp.prj_id}">없음</button>
									</c:if>



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

					<a class="content title" style="margin-left: 10px">누적 금액</a>
					<div class="content" style="text-align: right; margin-right: 20px;">
					<p class="content" >
						<a class="content " id="modaltotalwon"></a> <a class="content "
							id="modaltotalwei"></a>
					</p>
					</div>
					<p class="content prj" style="margin-left: 10px">리스트</p>
					<div class="content form-select" id="dropdown">
						<select class="content prjlist" id="ddown"
							style="overflow: scroll;">
							<option value="">-- Select --</option>
						</select> <input type="hidden" id="thismuid" value="">
					</div>


				</div>
			</div>
			<div style="position: relative; text-align: center;">
			<button type="button" class="btn_4 modalInbtn" onclick="request()">송금</button>
			&nbsp;
			<button type="button" class="btn_4 ">취소</button>
			</div>
		</div>
	</div>


	<div class="loader" style="display: none;">
		<img src='resources/images/ethloading.gif'
			style='display: block; position: absolute; top: 40%; left: 40%; z-index: 100;' />"
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
              && !$(e.target).hasClass("prjlist") 
              && !$(e.target).hasClass("current")) {
            $('.modaldal').fadeOut();
            $('.modal__background').fadeOut();
            $('#modaltotalwon').html('');
	     	$('#modaltotalwei').html('');
	     	$('#dropdown > div > span').html('-- Select --');
	    	$('#thismuid').val('');
	    	$(".list").empty();
	    	
          
        }
    }
    $('html').click(function(e){
        //console.log(e.target);
        check(e);
    });
    
   
 
    function jebal() {
    	console.log("이야~~~~~~");
    	//debugger;
    	//console.log(e);
    	//current   this.muid.buy_muid
    	
    	$('#dropdown > div > span').html(event.path[0].textContent);
    	$('#thismuid').val(event.path[0].attributes[3].nodeValue);
    	
	}
    $('.money').click(function(e){
    	console.log("정산");
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
	    			 console.log("ajax");
			     	//console.log(res);
			     	$('#modaltotalwon').html(res.sumWon + " 원");
			     	$('#modaltotalwei').html(res.sumWei + " wei");
					var ccount = 1; 
			     	for(muid of res.muids){
						 //console.log(muid.buy_date);
						 //console.log(muid.buy_muid);
						 //console.log(muid.sumwei);
						 //console.log(muid.sumwon);
						 
	 					$(".list").append(`
	 		 					
	 							<li data-value onclick="jebal()" class="lilist content" value="\${muid.buy_muid }"
	 								style="margin-left: 10px">\${ccount++} 건 | 거래코드 \${muid.buy_muid }| \${muid.sumwon} 원 | \${muid.sumwei} wei</li>
	 					`);
	 					
					 }
			     	$(".list").css("overflow-y","scroll");
			     	$(".list").css("height","300px");
					 
			        },
			        error:function(){
			          console.log("ajax 통신 실패!!!");
			        }
				}) //ajax 
	
    });
    
    
    function request() {
    	//debugger;
			console.log("송금시작");
			var code = document.getElementById("thismuid").value; 
			console.log(code);
		
			if(code > 0 ){
				console.log("if~~~ 코인");
				
				//코인 정산시
			//var account =  ${sessionScope.sessionUser.ether_id };
			//console.log(account);
			
			//로딩창 킴
			$("div.loader").css("display","block");
				//블록체인 접속 시작////////////확인할것//////////////////////////////////////////////////////////
			solidityRewardFnc.methods
				.EndAry(code)
				.send({from:account ,  })
				.then(function(result){
					
					
					$.ajax({
		    		url: 'ajaxMuidUpDate',
		    		type: 'post',
		    		data: {
		    			buy_muid : code
		    		},
		    		 success: function(res){
		    			 console.log("ajax");
				     	
		    			 if(res == 1){
							 console.log("정산");	
					           
				          }else{
				             console.log("정산 Fail!!!");
				          } 
				          
				          location.reload();
		    			 
						 
				        },
				        error:function(){
				          console.log("ajax 통신 실패!!!");
				        }
					}) //ajax  
				});
				
				
			} else {
				console.log("else~~~ 현금");
				
				
				
				
				$.ajax({
		    		url: 'ajaxMuidUpDate',
		    		type: 'post',
		    		data: {
		    			'buy_muid' : code
		    		},
		    		 success: function(res){
		    			 console.log("ajax");
				     	
					     	
		    			 if(res == 1){
							 console.log("정산");	
					           
				          }else{
				             console.log("정산 Fail!!!");
				          } 
				          
				          location.reload();
						 
				        },
				        error:function(){
				          console.log("ajax 통신 실패!!!");
				        }
					}) //ajax 
				
				
				
				
				
			}
			

		}
	
	
	
	
	
    $('.nono').click(function(e){
    	toastr.error("정산할 건이 없습니다.");
    	
    })
	

    

	
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