<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/build2/styles.css">
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
		<h3>project insert</h3>
		<form method="post" onsubmit="return check()">
			<div>
				<label for="title">제목</label> <input type="text"
					placeholder="제목을 입력하세요">
			</div>
			<div>
				<label for="content">내용</label>
				<div id="editor"></div>

				<script>
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
				
						watchdog
							.create(document.querySelector('#editor'), {
				
								licenseKey: '',
	
							})
							.catch(handleError);
				
						function handleError(error) {
							console.error('Oops, something went wrong!');
							console.error(
								'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:'
							);
							console.warn('Build id: evno2ybtoyrh-aylwhf71detk');
							console.error(error);
						}
					</script>

			</div>
			<input type="submit" value="저장">
		</form>
	</div>
	<script type="text/javascript">
function check() {
	console.log("들어오냐?");
	var content = event.path[0].childNodes[3].outerHTML;
	var content2 = event.path[0].childNodes[3].outerText;
	var content3 = document.querySelector("body > div:nth-child(13) > form > div:nth-child(2) > div > div.ck.ck-editor__main > div").innerHTML;
	var content4 = watchdog._getData();
	console.log(content4);
	//console.log(content3);
	console.log(this);
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