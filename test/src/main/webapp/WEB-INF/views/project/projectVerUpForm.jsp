<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" type="text/css" href="resources/build2/styles.css"> -->
<script src="resources/build2/ckeditor.js"></script>
<style type="text/css">
  .name {
            font-weight: bold;
            font-size: large;
        }

  .button {
      margin-right: 2%;
  }
</style>
</head>
<body data-editor="ClassicEditor" data-collaboration="false"
	data-revision-history="false">
	${sessionScope }<br>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="float: right;">PROJECT UPDATE</h2>
						</div>
					</div>
						<div >
							<h4 style="float: right; color: #fff">프로젝트 수정</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-12">
                <h2 class="contact-title">수정하기</h2>
            </div>
            <div class="col-lg-8">
				<form class="form-contact contact_form" action="projectVerUpdate" onsubmit="return check()" method="post" enctype="multipart/form-data">
					<div class="row">
						<input type="hidden" id="prj_id" name="prj_id" value="${project.prj_id }">
						<input type="hidden" id="master_id" name="master_id" value="${sessionScope.sessionUser.user_id }">
	                    <div class="col-sm-6">
							<div class="form-group">
	                            <p>프로젝트 명</p>
								<div class="name">${project.prj_name }</div>
                        	</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<p>신청일 ~ 마감일</p>
								<input id="prj_str" name="prj_str" required="required" 
								value="<fmt:formatDate value="${project.prj_str }" pattern="yyyy-MM-dd" />" 
								type="date"> ~ 
								<input id="prj_ed" name="prj_ed" 
								value="<fmt:formatDate value="${project.prj_ed }" pattern="yyyy-MM-dd" />" 
								type="date" required="required"><br>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<p>펀딩여부
									<input type="checkbox" id="prj_fnd_prop" name="prj_fnd_prop" value="${project.prj_fnd_prop }" 
									<c:if test="${project.prj_fnd_prop  == 1 }">
									checked="checked"
									</c:if>
									>
								</p>
							</div>
						</div>
						<div class="col-12" id="fnd_dis" style="display: 
						<c:if test="${project.prj_fnd_prop  == 0 }">
						none
						</c:if>
						;">
							<div class="form-group">
								<p>메인사진</p>
								<input class="button" type="file" id="mul" name="mul">
							</div>
							<div class="form-group">
								<p>펀딩 시작일 ~ 마감일</p>
								<input id="prj_fnd_str" name="prj_fnd_str" 
								value="<fmt:formatDate value="${project.prj_fnd_str }" pattern="yyyy-MM-dd" />" 
								type="date"> ~ 
								<input id="prj_fnd_ed" name="prj_fnd_ed" 
								value="<fmt:formatDate value="${project.prj_fnd_ed }" pattern="yyyy-MM-dd" />"  
								type="date" ><br>
							</div>
							<div class="form-group">
								<p>목표금액</p>
								<p><input type="number" id="prj_gl_prc" name="prj_gl_prc" value="${project.prj_gl_prc }" class="inNum" placeholder="목표금액">만원</p>
							</div>
						</div>
						
						<br>
						
						<div class="col-12">
							<div class="form-group">
								<p>구인여부
									<input type="checkbox" id="prj_ofr_prop" name="prj_ofr_prop"  value="${project.prj_ofr_prop }"
									<c:if test="${project.prj_ofr_prop  == 1 }">
									checked="checked"
									</c:if>
									>
								</p>
							</div>
						</div>
						<div class="col-12" id="ofr_dis" style="display: 
						<c:if test="${project.prj_ofr_prop  == 0 }">
						none
						</c:if>
						;">
							<div class="form-group">
								<p>구인 시작일 ~ 마감일</p>
								<input id="prj_ofr_str" name="prj_ofr_str" 
								value="<fmt:formatDate value="${project.prj_ofr_str }" pattern="yyyy-MM-dd" />" 
								type="date"> ~ 
								<input id="prj_ofr_ed" name="prj_ofr_ed" 
								value="<fmt:formatDate value="${project.prj_ofr_ed }" pattern="yyyy-MM-dd" />" 
								type="date"><br>
							</div>
							<div class="row">
								<div class="col-4 form-group">
									<p>프론트</p>
									<p><input type="number" id="prj_frn_prs" name="prj_frn_prs" value="${project.prj_frn_prs }" class="inNum" placeholder="필요인원"> 명</p>
								</div>
								<div class="col-6 form-group">
									<p>백</p>
									<p><input type="number" id="prj_bk_prs" name="prj_bk_prs" value="${project.prj_bk_prs }" class="inNum" placeholder="필요인원"> 명</p>
								</div>
								<div class="col-4 form-group">
									<p>DB</p>
									<p><input type="number" id="prj_db_prs" name="prj_db_prs" value="${project.prj_db_prs }" class="inNum" placeholder="필요인원"> 명</p>
								</div>
								<div class="col-6 form-group">
									<p>서버</p>
									<p><input type="number" id="prj_ser_prs" name="prj_ser_prs" value="${project.prj_ser_prs }" class="inNum" placeholder="필요인원"> 명</p>
								</div>
							</div>
							<div class="form-group">
								<p>지역</p>
								<input type="text" id="prj_ar" name="prj_ar" value="${project.prj_ar }" placeholder="지역">
							</div>
							<div class="form-group">
								<p>조건</p>
								<input class="form-control" type="text" id="prj_cnd" name="prj_cnd" value="${project.prj_cnd }" placeholder="조건">
							</div>
						</div>
						<div class="col-12">
						 	<div class="form-group">
								<p>상세내용</p>
								<div class="form-control w-100" id="editor" >${project.prj_cnt }</div>
							</div>
							<input type="hidden" id="prj_cnt" name="prj_cnt">
						</div>
						<div class="col-9">
							<div class="form-group mt-3">
								<input type="submit" class="button" value="등록">
								<input type="reset"  class="button" value="초기화">
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-4">
	            <div class="media contact-info">
	                <span class="contact-info__icon"><i class="ti-home"></i></span>
	                <div class="media-body">
	                <h3>Buttonwood, California.</h3>
	                <p>Rosemead, CA 91770</p>
	                </div>
	            </div>
	            <div class="media contact-info">
	                <span class="contact-info__icon"><i class="ti-tablet"></i></span>
	                <div class="media-body">
	                <h3>00 (440) 9865 562</h3>
	                <p>Mon to Fri 9am to 6pm</p>
	                </div>
	            </div>
	            <div class="media contact-info">
	                <span class="contact-info__icon"><i class="ti-email"></i></span>
	                <div class="media-body">
	                <h3>support@colorlib.com</h3>
	                <p>Send us your query anytime!</p>
	                </div>
	            </div>
            </div>
        </div>
	</div>       
	<script type="text/javascript">
		
		$(document).ready(function(){
		    $("#prj_fnd_prop").change(function(){
		        if($("#prj_fnd_prop").is(":checked")){
		        	document.getElementById("fnd_dis").style.display = "block";
		        	$("#prj_fnd_str").attr("required",true);
		        	$("#prj_fnd_ed").attr("required",true);
		        	$("#prj_gl_prc").attr("required",true);
		        }else{
		        	document.getElementById("fnd_dis").style.display = "none";
		        	$("#prj_fnd_str").attr("required",false);
		        	$("#prj_fnd_ed").attr("required",false);
		        	$("#prj_gl_prc").attr("required",false);
		        	//체크 다시 해제할때 값 비워줘야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		        }
		    });
		    
		    $("#prj_ofr_prop").change(function(){
		        if($("#prj_ofr_prop").is(":checked")){
		        	document.getElementById("ofr_dis").style.display = "block";
		        	$("#prj_ofr_str").attr("required",true);
		        	$("#prj_ofr_ed").attr("required",true);
		        }else{
		        	document.getElementById("ofr_dis").style.display = "none";
		        	$("#prj_ofr_str").attr("required",false);
		        	$("#prj_ofr_ed").attr("required",false);
		        	//체크 다시 해제할때 값 비워줘야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		        }
		    });
		});
			
		function dateFun() {
			//이거 해야됨~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			console.log("날짜 바꾸자? 디폴트 sysdate 안되고 시작 끝 날짜 디테일 줄것");
			
			
		}
		
		//체크박스 체크하면 하위 값들 필수로 들어가게 할것!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
		function check() {
			//console.log("들어오냐?");			
			//input number 값없을때 0으로
			var length = event.path[0].getElementsByClassName('inNum').length;
			for(i=0; i<length; i++){
				var val = event.path[0].getElementsByClassName('inNum')[i].value
				if (val == ''){
					console.log("input number 값없을때 0으로");
					event.path[0].getElementsByClassName('inNum')[i].value = 0;
					
				}
				
				console.log(val);
			}
			
			
			//ckeditor 입력값 가져오기
			//var content = event.path[0].childNodes[3].outerHTML;
			//var content2 = event.path[0].childNodes[3].outerText;
			//var content3 = document.querySelector("body > div:nth-child(13) > form > div:nth-child(2) > div > div.ck.ck-editor__main > div").innerHTML;
			var content4 = watchdog._getData(); //잘써야됨
			console.log(content4.main); //String 으로 전부 들어온다
			$("#prj_cnt").val(content4.main);
			//console.log(content3);
			console.log(this);
			
			
			
		}
	</script>

		
	<script>			
		//ckeditor 시작
		const watchdog = new CKSource.EditorWatchdog();
			
		window.watchdog = watchdog;
				
		watchdog.setCreator((element, config) => {
			return CKSource.Editor
			.create(element, config)
			.then(editor => {
				
				return editor;
				})
			});
				
		watchdog.setDestructor(editor => {
			
			return editor.destroy();
		});
					
		watchdog.on('error', handleError);
					
		watchdog.create(document.querySelector('#editor'), {
			placeholder: '상세 내용을 입력해 주세요',
			licenseKey: '',
			simpleUpload: {
					       uploadUrl: "/prj/upload/image",
					       withCredentials: true,
					       }
		
			}).catch(handleError => {
									console.log(handleError);
									})
					
		function handleError(error) {
			console.error('Oops, something went wrong!');
			console.error('Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:');
			console.warn('Build id: evno2ybtoyrh-aylwhf71detk');
			console.error(error);
		}
	</script>
	
</body>
</html>


<!-- 
	<script>
		ClassicEditor
			.create(document.querySelector('.editor'), {

				licenseKey: '',



			})
			.then(editor => {
				window.editor = editor;




			})
			.catch(error => {
				console.error('Oops, something went wrong!');
				console.error(
					'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:'
				);
				console.warn('Build id: 6e04cvqc70eu-aylwhf71detk');
				console.error(error);
			});
	</script> 
-->