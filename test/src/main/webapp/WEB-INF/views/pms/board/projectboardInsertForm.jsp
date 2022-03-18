<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/build2/ckeditor.js"></script>
</head>
<body>
    <section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2 style="text-align: center; position: relative; right: 3%;">게시판 등록페이지</h2>
						</div>
					</div>
						
				</div>
			</div>
		</div>
	</section>
    <!-- breadcrumb start-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section section_padding">
    <div class="container">
      


      <div class="row">
        <div class="col-12">
                 <div class="col-12">
         			<h2 class="contact-title col-9" style="display: inline-block; text-align: center; position: relative; left: 10%;">게시판 등록</h2>
          			<c:if test="${sessionUser.user_ath eq  'master'}">
          			<h4 class="col-2" style="display: inline-block;">공지여부<input type="checkbox" id="confirm-checkbox"> <label
            for="confirm-checkbox"></label></h4>
          			</c:if>
          			
        </div>
        </div>
        <div class="col-lg-12">
          <form class="form-contact contact_form" onsubmit="return checkbox()" action="msprojectBoardInsert" method="post" id="contactForm" novalidate="novalidate">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <input class="form-control" name="brd_ttl" id="brd_ttl" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder = 'Enter Subject'>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  
                    <div class="form-control w-100" id="editor" ></div>
                    <input type="hidden" id="brd_cnt" name="brd_cnt">
                </div>
              </div>
        
             <input type="hidden" id="user_id" name="user_id" value="${sessionUser.user_id }">
             <input type="hidden" id="prj_id" name="prj_id" value="${myPrj.prj_id }">
             <input type="hidden" id="brd_ntc_prop" name="brd_ntc_prop" value="0">
             
            </div>
            <div class="form-group mt-3" style="display: inline-block;" >
              <button type="submit" class="btn btn-primary todo">등록</button>
            </div>
          </form>
        </div>
   
      </div>
    </div>
  </section>
  <script type="text/javascript">
  function checkbox() {
		if ($('input:checkbox').is(':checked') == true)
			{
				$("#brd_ntc_prop").val("1");			
			}
		var content4 = watchdog._getData();
		$("#brd_cnt").val(content4.main);
		return true;
		
	}
  
  
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