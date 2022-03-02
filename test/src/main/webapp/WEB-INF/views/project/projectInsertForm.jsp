<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" type="text/css" href="resources/build2/styles.css"> -->
<script src="resources/build2/ckeditor.js"></script>
</head>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<body data-editor="ClassicEditor" data-collaboration="false"
	data-revision-history="false">

	<div>
		<h3>프로젝트 등록</h3>
		<form action="projectInsert" onsubmit="return check()" method="post" enctype="multipart/form-data">
			
			<!-- 로그인 구현되면 수정할것 --><input type="hidden" id="master_id" name="master_id" value="0">
			
			<div>
				제목
				<input type="text" id="prj_name" name="prj_name" placeholder="제목을 입력하세요" required="required">
			</div>
			<div>
				신청일~마감일
				<input id="prj_str" name="prj_str" type="date">~<input id="prj_ed" name="prj_ed" type="date" required="required"><br>
			</div>
			<div>
				펀딩여부
				<input type="checkbox" id="prj_fnd_prop" name="prj_fnd_prop" value="1">
			</div>
			<div>
				메인사진
				<input type="file" id="mul" name="mul" ><br>
				
				펀딩 시작일~마감일
				<input id="prj_fnd_str" name="prj_fnd_str" type="date">~<input id="prj_fnd_ed" name="prj_fnd_ed" type="date" ><br>
				목표금액
				<input type="number" id="prj_gl_prc" name="prj_gl_prc" class="inNum" placeholder="목표금액">만원<br>
				
			</div>
			
			
			<div>
				구인여부
				<input type="checkbox" id="prj_ofr_prop" name="prj_ofr_prop" value="1">
			</div>
			<div>
				구인 시작일~마감일
				<input id="prj_ofr_str" name="prj_ofr_str" type="date">~<input id="prj_ofr_ed" name="prj_ofr_ed" type="date"><br>
				프론트
				<input type="number" id="prj_frn_prs" name="prj_frn_prs" class="inNum" placeholder="필요인원">명<br>
				백
				<input type="number" id="prj_bk_prs" name="prj_bk_prs" class="inNum" placeholder="필요인원">명<br>
				DB
				<input type="number" id="prj_db_prs" name="prj_db_prs" class="inNum" placeholder="필요인원">명<br>
				서버
				<input type="number" id="prj_ser_prs" name="prj_ser_prs" class="inNum" placeholder="필요인원">명<br>
				조건
				<input type="text" id="prj_cnd" name="prj_cnd"  placeholder="조건"><br>
				지역
				<input type="text" id="prj_ar" name="prj_ar" placeholder="지역">
			</div>
			<div>
				상세내용
				<div id="editor" ></div>

				<input type="hidden" id="prj_cnt" name="prj_cnt">

			</div>
			<input type="submit" value="등록">
			<input type="reset" value="초기화">
		</form>
	</div>
	<script type="text/javascript">
		function dateFun() {
			//이거 해야됨~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			console.log("날짜 바꾸자? 디폴트 sysdate 안되고 시작 끝 날짜 디테일 줄것");
			
		}
	
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